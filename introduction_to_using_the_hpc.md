---
layout: doc
status: complete
title: Introduction to using the HPC
---

## Introduction

The HPC (High Performance Computing) service is a means to run programs in
parallel. Although this can be done on your local machine, it cannot be done
on anywhere near the same scale. This allows you to run programs that might have
taken months if not years to complete in a few hours or days. The HPC is a UNIX
based server that consists of multiple CPUs. An HPC service is usually provided
by your university or research institute. If not, there are other commercial
services available. These servers are often composed of 1,000s of cores each
equivalent to a powerful computer.

## What is parallel computing?

Parallel computing is the opposite of sequential computing. Instead of running
a program over a set of data sequentially, you split the data up into chunks
and run the program sequentially over those chunks simultaneously. To give a
trivial example, imagine a program that consists of a single for loop that
prints the numbers 1 to 100. A simple way to parallelise this program would be
to run two for loops simultaneously, one counting the numbers 1-50 and the
other, 51-100. This, in theory, should be twice as fast. The only downside is
running two processes in parallel will take twice the amount of computing power.

## Do I need the HPC?

If you have a program that is taken a long time you may need to use the HPC. I
would suggest, however, to only use the HPC if you've got a program which is
taking months to complete rather than days. Understanding how to use the HPC can
be a long process and for programs that can be parallelised on your local machine
there are simpler alternatives. If you're an R user [here](http://www.r-bloggers.com/parallel-r-loops-for-windows-and-linux/)
is a really good blog post on how to parallelise your for loops. For python
users, you can make use of a variety of libraries: [Queue](https://docs.python.org/2/library/queue.html),
[threading](https://docs.python.org/2/library/threading.html) and
[subprocess](https://docs.python.org/2/library/subprocess.html). And then in
this [example](http://stackoverflow.com/questions/2846653/python-multithreading-for-dummies).

## A simple guide on how to use the HPC

### You will need

1. A user account on an HPC server. This will usually require a demonstration
of need, competence in using UNIX command-line (see our [guide](http://bes-qsig.github.io/fge/docs/unix_ssh_introduction/))
and, often, for you to complete a tutorial on using the HPC (institution dependent).
2. A program that can be parallelised.

### How to parallelise a program

In the above trivial example, we had a for loop counting from 1-100. This is a
readily parallelisable program because the process of printing each number is
independent. We can cut the data set (in this case the numbers 1-100) into a
maximum of 100 chunks, and run each chunk as a separate process. The process of
printing a number is called a **job**. So long as jobs are independent then a
program can be easily parallelised. If, however, our program was more
complicated and the results of one job depended on the results of another then
the program would be very difficult to parallelise. Parallelising such programs
is possible but is beyond the scope of this document (look up the map-reduce
method and perhaps find an expert in high performance computing).

Make sure the program you are using has options or a version that can run on an
HPC server, e.g. look for the words 'MPI'. Otherwise, if you're running your own
program then you may have to rejig it to get it to work on the HPC. You will
need to check the following things:

* Is my program divisable into independent jobs?
* How can I cut my program up into these jobs?
* How can I run each job independently?

If you can run a script with an argument that will work on one part of your data
set independently of other parts, then you can run your program in parallel.
At this stage you simply need to create a **task farm** script that will run
your program in chunks. Below is a python script that outlines how this can be
done. The script consists of three functions: `job()`, `master()` and `worker()`.
It takes a **worklist** (the list of all jobs that needs to be run), feeds them
to a **worker** (as executed by the `worker()` function) that executes the job,
waits for the job to finish and sends a signal to the **master** (as executed by
the `master()` function) to call for another job. This continues until the
worklist is depleted. The job can be anything (excution of python scripts,
R scripts or any other program), it will simply run a script using whatever
argument has been given to it via the worklist.

```python
#! /bin/usr/env python

# PACKAGES
import os
import sys
from mpi4py import MPI


# GLOBALS
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

# FUNCTIONS
def job(jobid):
    '''Run independent job'''
    print "running job ", jobid


def master(worklist):
    '''The task master takes a work list and farms it out to the workers.'''
    # Check we are not using more ranks than what we need.
    nranks = comm.Get_size()
    if len(worklist) < (nranks-1):
        print "WARNING: There are fewer tasks than ranks. You are wasting \
resources!"
        for rank in range(len(worklist)+1, nranks):
            # Catch the send
            buff = comm.recv(source=rank)
            # Send completion signal
            comm.send("", dest=rank)
        # Reset number of ranks.
        nranks = len(worklist)+1
    # Farm out tasks
    for task in worklist:
        # Probe for any idle worker.
        status = MPI.Status()
        buff = comm.recv(source=MPI.ANY_SOURCE, status=status)
        idle_worker = status.Get_source()
        # Give worker task
        comm.send(task, dest=idle_worker)
    # Send null task to signal completion.
    for rank in range(1, nranks):
        comm.send("", dest=rank)
    return


def worker(task_operation):
    '''The worker takes as an input the operation it should apply to the tasks
       that it receives from the task master.'''
    while True:
        # Alert master that we are waiting.
        comm.send("")
        # Wait for a task
        task = comm.recv()
        if task == "":
            break
        else:
            task_operation(task)
    return


if __name__ == '__main__':
    worklist = sys.argv[1:]  # obtain worklist from command-line
    print 'Using: ', worklist
    if rank == 0:
        master(worklist)
    else:
        worker(job)
```

For example, to go back to my trivial example of counting 1-100. Let's imagine
I want to run two workers (1-50, 51-100). I could then create two R scripts
that looped through the two sets of numbers: 1_50.R and 51_100.R. The `job()`
function could then be a function that takes as an argument the name of an R
script and executes it. I would then execute the task farm like so:
`task_farm.py 1-50.R 51-100.R`. (In practice, this is not a great example as
it would require each job to have its own script.)

### PBS script

The PBS script is the instructions for running your parallel program across
all the nodes and clusters available to you through the HPC server. It specifies
the number of processes you wish to use and the amount of time you require for
it to run. Below is an example of a pbs script.

```bash
#!/bin/bash
#PBS -l select=1:ncpus=16:mpiprocs=16:ompthreads=1
#PBS -l walltime=24:00:00

mpiexec python path_to_task_farm.py argument_for_task_farm.py
```

In this example it consists of two key elements: the PBS instructions denoted
with `#PBS` and the execution command for the task farm script. The PBS
instructions select 1 node of 16 CPUs. It allows up to 16 workers (called
mpiprocs) and each of these workers use 1 thread each. If I wanted to double
the number of workers I would make `select=2`, as this would select 2 nodes
instead of 1. The instructions also prevent the program from running for more
than 24 hours. You should check with your administrator what sort of cores are
available to you and what the maximum walltime is.

### HPC structure

An HPC server contains multiple cores. Each core can have a number of CPUs.
For example, on my HPC server I have access to three types of core: 16CPU, 12CPU
 and an 8CPU. So if I wanted to select 24 CPUs I could select 2 12CPU cores,
or if I needed 32 I could select 4 8CPU cores or 2 16CPU cores. Just make sure
you are not selecting cores that do not exist on the server. If you do this,
your program will be queued indefinitely. (On my system it is put on a queue
called Monster.)

### Launching and checking

To launch a PBS script you use the command `qsub`:

```bash
qsub my_pbs_script.sh
```

This will add the script to a queue. To check whether your script is being run
use the `qstat` function.

```
qstat  # no arguments necessary
```

This will print to screen, the ID of your job, how long the program has been
running or whether it is still in the queue. All output and error messages
generated by your program are sent to files called: [name of job].e[ID] and
[name of job].o[ID]. These will not be available until after walltime, and
there is always a few minutes delay. It is always good therefore to have an
alternative way of making sure your program is running correctly. For programs
jobs always make changes to directories, I can then check the progress of my
program by counting the number of changes to these directories.

## HPC directory house-keeping

### Logging in

To log in you will need to use the `ssh` command or WinSCP if you're using
Windows. You will need to check what your account username and password is
through the system administrator. Once logged in you will be taken to your
home directory. A HPC server consists of multiple nodes, you log into the
login node. Usually you will not be running any programs on this login node. It
is just the portal for executing commands that run across all the nodes in the
HPC.

### Home and work directory

You usually have available to you two directories where you can store data:
the home and work directories. The home directory is smaller than the work, you
should check these details with your administrator. I usually store my programs
in the home directory and all my data and results files in the work directory.
I also create a link to my work directory in the home directory to prevent
having to write the work directory multiple times, e.g.
```bash
ln -s /work/[username] work
```

### Modules

You usually have a variety of programs available to you already on the HPC
server. If a command is not recognised, you may have to manually load programs
using the `module` function.

```bash
module av  # list all available modules
module load [name-of-module]  # load the module
```

I add these commands to my bash profile for any programs I use regularly.

```
# make sure you're in your home directory
echo 'module load python/2.7.3 >> .bash_profile'  # my preferred version of python
```

### Installing packages and programs

You may have to install dependent packages, libraries and programs in order to
run your program(s) that may not be available from modules. You can either
request an administrator to install it for you, or you may have to compile it
yourself in your home directory. You can compile programs yourself so long as
you do not append them to the system path (which requires administrator
privileges). Instead you will have to directly call your compiled version of
the program with its absolute link. Or you could create your own virtual
environment (document coming for this soon!). When compiling yourself make sure
you are aware of the HPC architecture (Intel, AMD ...) and call the relevant
modules before compilation, this will allow the compiled program to run more
efficiently.

## Useful links

Your best source of information for using the HPC server is from your
administrator and the HPC technical team. They should offer courses and guides.
Otherwise, there is plenty of information on the web that can be of use.
Here are some links for different institute's HPC services (some institutes are
better at giving instructions than others ....). Although HPC systems differ
between institutions they are quite similar and can still be helpful, particular
if common problems keep occurring.

* [UTMB](http://bose.utmb.edu/Compu_Center/Cluster_users/PBS%20HOWTO/PBS_HOW_TO.html)
* [Oxford](http://www.arc.ox.ac.uk/content/pbs)
* [Minnesota](https://www.msi.umn.edu/resources/job-submission-and-scheduling-pbs-scripts)
* [USC](https://hpcc.usc.edu/support/documentation/running-a-job-on-the-hpcc-cluster-using-pbs/)

And background information ....

* [Wiki](https://en.wikipedia.org/wiki/Supercomputer)


## Acknowledgments

Thanks to Gerard Gorman for the python task farm example.
