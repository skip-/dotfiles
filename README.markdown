dotfiles
--------

dofiles 1.0 -- 2012-02-08

Introduction
------------

I enjoy using \*nix environments. I like the customizability of them, the options and ultimately, making the interface and tools conform to the way _I_ work instead of the otherway around. As such, I've built up a nice set configuration that I like to replicate whenever I have to move to a new development platform.

In the past, I had a pretty involved setup for working with SGML and converting it to HTML output, and at one point I was heavily customizing FVWM2. I lost those configs somewhere along the way, but my vimrc and plugins have weathered the storms and are still around. 

I've used subversion and cvs to store my config files in the past. Recently I started a job that requires that I work in a \*nix environment again and I love it -- only I was missing my configuration customizations. I dug up my most recent VIM setup and as I was looking around found that GitHub has become a fairly popular place for storing configuration files since it's generally available and affords a pleasant way to access and track changed files.

So this is my set of configuration files that I prefer. This may/will evolve as I use it (or languish if I don't ;) ). I'll try markdown first for documentation and may move to some other format if I find it cumbersome or I get tired.

General Information
-------------------

This set of configuration files for VIM should work in Windows as well. Since corporate environments generally set the home drive to a network backup drive, I have two vimrc files - the first one goes in the system HOME directory and is customized to point to my vimfiles dir and the vimrc that lives there. The second, I just mentioned, lives in vimfiles and contains the actual customizations that I enjoy using in VIM. 

Recent development of the pathogen plugin by TPope has caught my interest and I am currently exploring a new setup built around [sontek's VIM as IDE setup][vide], merged with some information from mirnazim and his [List of vim plugins I use][mnazim]. It's a really slick way to build up a VIM setup and keep plugin's up-to-date. I really like the plugins they use and the configuration using pathogen so far. The only downside is that work doesn't allow pulling remote GIT repos through the firewall, so I just have to grab and update things manually at home and email myself the bundled files or take my laptop home and update while there. 

    [vide]:   http://sontek.net/turning-vim-into-a-modern-python-ide
    [mnazim]: http://mirnazim.org/writings/vim-plugins-i-use/

The other thing that is new for me is putting dotfiles in a separate directory that I then "install" from. This will only be for use in the \*nix environment since Windows doesn't like files that start with '.' for hiding them. I'm referencing [Ryan Bates' dotfiles project][rbates] and [rtomayko's dotfiles project][rtomayko]. Good work for reference from both and some interesting environments.

    [rbates]:   https://github.com/ryanb/dotfiles/blob/master/README.rdoc
    [rtomayko]: https://github.com/rtomayko/dotfiles

Installation
------------


