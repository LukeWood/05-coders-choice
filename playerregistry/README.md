# BulletRegistry

I thought it made sense to have a process that handles all bullet related
activities.  The bullet registry has a few interesting design choices that
are a part of it.  They are as follows:

1.) The only time you can influence the progression of the BulletRegistry is
during a tick - you queue up updates and upon a tick it will apply the updates.

2.) BulletRegistry exists in the transient state - they are owned by a game and
if a game dies I do not want to try to reboot it - it will simply shut down.
