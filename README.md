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
After you've done this, you can include the plugin in your source. Because it is
a Liquid Tag and not a Generator or stuff, you can include it where you want to.
Just write

    {% category_groups %}

The output will is done with ul and li html-tags, so you may put it in a div and 
customize it as you want.

Bugs?
-----

You found a bug? Please tell me, via E-Mail or via github!


Feel free to fork.
------------

Currently there is no support for adding a category into more groups. I'm not
sure I will implement this. So if you want to, send me a pull request for it!

[jekyll]: https://github.com/mojombo/jekyll
