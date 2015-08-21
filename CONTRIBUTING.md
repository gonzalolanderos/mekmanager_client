# Contributing

Like almost all open source project, we love to see pull requests coming in,
to make sure that this is the best and most collaborative environment, we have
some guidelines to be followed.

If you would like to contribute, but aren't sure where or how to get started,
please see our wiki page on getting started:
link coming soon.

Above all else please adhere to :
MINASWAN (Matz Is Nice And So We Are Nice)
[MINASWAN](https://en.wikipedia.org/wiki/MINASWAN)

Another good resource is the open source code of conduct:
[Open Source Code of Conduct](https://thoughtbot.com/open-source-code-of-conduct)

## Commit messages:

In Short:
 - Please keep commit messages to 50 characters or less, and keep the body to
   about 72 characters; wrap as needed.
 - Please use present tense, and avoid past tense as much as possible.

More verbose:
A link to the classic tpope blog post about good commit messages:
[link](tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

A lot of people don't realize git commit messages have subject lines and bodies
very much like an email. Keep the subject of the commit to 50 characters or less
it should be a brief overview of the commit. if more is required go down two
lines in your commit message, and your in the body. Please wrap lines at about
72 characters.

```shell
$ git commit -m "Increase test coverage for some class
$
$ This begins the commit message body, if your commit needs more
$ explination, feel free to describe it down in this area.
$
$ If your commit relates to an issue you can reference it by it's number.
$ For examples closes #13 would close issue number 13 when pulled in.
$
$ You can describe thing with bullets like so:
$ - a point
$ - another point
$ and add the closing quote when you're done."
```

Why not use past tense?:
In short, because the commit could end up anywhere.

Git allows a workflow where a commit might end up moving around at some point,
unlike centralized version control, commits are not stuck where they were
added. Speaking in past tense can cause the commit message to no longer make
sense if it's moved.
