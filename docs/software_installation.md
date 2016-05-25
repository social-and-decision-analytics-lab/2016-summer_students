---
title: "Installtion Instructions"
output: 
  github_document:
    toc: true
    toc_depth: 2
---

# Overview

These are the installation instructions taken from [http://software-carpentry.org/](Software-Carpentry) and
how they layout their workshop [http://chendaniely.github.io/workshop-template-empty/](template).
If you use the template, link, the directions are actually posted in there.
The directions below are simply a reproduction of the same instructions.

# The Bash Shell

Bash is a commonly-used shell that gives you the power to do simple tasks more quickly.

## Windows
Install Git for Windows by downloading and running [the installer](http://msysgit.github.io/). This will provide you with both Git and Bash in the Git Bash program.

## Mac OS X

The default shell in all versions of Mac OS X is bash, so no need to install anything. You access bash from the Terminal (found in `/Applications/Utilities`). You may want to keep Terminal in your dock for this workshop.

## Linux

The default shell is usually Bash, but if your machine is set up differently you can run it by opening a terminal and typing `bash`. There is no need to install anything.

# Git

Git is a version control system that lets you track who made changes
    to what when and has options for easily updating a shared or public
    version of your code
    on <a href="https://github.com/">github.com</a>. You will need a
    <a href="https://help.github.com/articles/supported-browsers/">supported</a>
    web browser (current versions of Chrome, Firefox or Safari,
    or Internet Explorer version 9 or above).

## Windows

Git should be installed on your computer as part of your Bash install (described above).

## Mac OS X

<strong>For OS X 10.8 and higher</strong>, install Git for Mac
	by downloading and running
	<a href="http://sourceforge.net/projects/git-osx-installer/files/latest/download">the installer</a>.
	After installing Git, there will not be anything in your <code>/Applications</code> folder, 
	as Git is a command line program.
	<strong>For older versions of OS X (10.5-10.7)</strong> use the
	most recent available installer for your
	OS <a href="http://sourceforge.net/projects/git-osx-installer/files/">available
	  here</a>.  Use the Leopard installer for 10.5 and the Snow
	Leopard installer for 10.6-10.7.
	
## Linux

If Git is not already available on your machine you can try to
	install it via your distro's package manager. For Debian/Ubuntu run
        <code>sudo apt-get install git</code> and for Fedora run
        <code>sudo yum install git</code>.
        
# Text Editor

# Python

<a href="http://python.org">Python</a> is a popular language for
    scientific computing, and great for general-purpose programming as
    well.  Installing all of its scientific packages individually can be
    a bit difficult, so we recommend an all-in-one installer.
    
Regardless of how you choose to install it,
      <strong>please make sure you install Python version 2.x and not version 3.x</strong>
      (e.g., 2.7 is fine but not 3.4).
      Python 3 introduced changes that will break some of the code we teach during the workshop.
    
We will teach Python using the IPython notebook, a programming environment
      that runs in a web browser. For this to work you will need a reasonably
      up-to-date browser. The current versions of the Chrome, Safari and
      Firefox browsers are all <a 
      href='http://ipython.org/ipython-doc/2/install/install.html#browser-compatibility'>supported</a> 
      (some older browsers, including Internet Explorer version 9 and below, are not).
      
## Windows

<ul>
	<li>
          Download and
          install <a href="https://store.continuum.io/cshop/anaconda/">Anaconda</a>.
	</li>
	<li>
          Download the default Python 2 installer (do not follow the link to version 3).
	  Use all of the defaults for installation
          <em>except</em> make sure to check
	  <strong>Make Anaconda the default Python</strong>.
	</li>
      </ul>
## Mac OS X
<ul>
	<li>
          Download and
          install <a href="https://store.continuum.io/cshop/anaconda/">Anaconda</a>.
	</li>
	<li>
          Download the default Python 2 installer (do not follow the link to version 3).
	  Use all of the defaults for installation.
	</li>
      </ul>

## Linux

We recommend the all-in-one scientific Python installer
	<a href="http://continuum.io/downloads.html">Anaconda</a>.
	(Installation requires using the shell and if you aren't
	comfortable doing the installation yourself just
	download the installer and we'll help you at the workshop.)

<ol>
	<li>
          Download the installer that matches your operating
          system and save it in your home folder.
	</li>
	<li>
          Open a terminal window.
	</li>
	<li>
          Type <pre>bash Anaconda-</pre> and then press
          tab. The name of the file you just downloaded should
          appear.
	</li>
	<li>
          Press enter. You will follow the text-only prompts.  When
          there is a colon at the bottom of the screen press the down
          arrow to move down through the text. Type <code>yes</code> and
          press enter to approve the license. Press enter to approve the
          default location for the files. Type <code>yes</code> and
          press enter to prepend Anaconda to your <code>PATH</code>
          (this makes the Anaconda distribution the default Python).
	</li>
</ol>
      

# R

<a href="http://www.r-project.org">R</a> is a programming language
    that is especially powerful for data exploration, visualization, and
    statistical analysis. To interact with R, we use
    <a href="http://www.rstudio.com/">RStudio</a>.

## Windows

Install R by downloading and running
	<a href="http://cran.r-project.org/bin/windows/base/release.htm">this .exe file</a>
	from <a href="http://cran.r-project.org/index.html">CRAN</a>.
	Also, please install the
	<a href="https://www.rstudio.com/products/rstudio/download/preview/">RStudio IDE</a>.

## Mac OSX

Install R by downloading and running
	<a href="http://cran.r-project.org/bin/macosx/R-latest.pkg">this .pkg file</a>
	from <a href="http://cran.r-project.org/index.html">CRAN</a>.
	Also, please install the
	<a href="https://www.rstudio.com/products/rstudio/download/preview/">RStudio IDE</a>.

## Linux

You can download the binary files for your distribution
	from <a href="http://cran.r-project.org/index.html">CRAN</a>. Or
	you can use your package manager (e.g. for Debian/Ubuntu
	run <code>sudo apt-get install r-base</code> and for Fedora run
        <code>sudo yum install R</code>).  Also, please install the
	<a href="https://www.rstudio.com/products/rstudio/download/preview/">RStudio IDE</a>.

# SQLite

SQL is a specialized programming language used with databases.  We
    use a simple database manager called
    <a href="http://www.sqlite.org/">SQLite</a> in our lessons.

## Windows

The <a href="{{site.swc_github}}/windows-installer">Software Carpentry
          Windows Installer</a> installs <code>sqlite3</code> for Windows. If
      you used the installer to configure `nano`, you don't need to run it again.

## Mac OS X

<code>sqlite3</code> comes pre-installed on Mac OS X.

## Linux

<code>sqlite3</code> comes pre-installed on Linux

# LaTeX

LaTeX is a document preparation system for high-quality typesetting. It is most often used for medium-to-large technical or scientific documents but it can be used for almost any form of publishing.

https://latex-project.org/ftp.html