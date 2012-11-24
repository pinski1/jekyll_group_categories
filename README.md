### This is a plugin for the awesome [jekyll] static site generator

How to install
--------------

fork or clone this repository

    git clone git://github.com/matthiasbeyer/jekyll_group_categories

move the file in your ~/blog/plugins/ directory

and add configuration to your _config.yml file:

    category_group_suffix: "_group"
    category_group_unused: "Ungrouped"

or something like this.
Now you can move your categories in groups:

    my_category_group: "GroupA"

where _group is the suffix you choose in the category_group_suffix variable.

Bugs?
-----

You found a bug? Please tell me, via E-Mail or via github!


I want more!
------------

Feel free to fork.

[jekyll]: https://github.com/mojombo/jekyll
