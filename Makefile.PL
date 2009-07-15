#!/usr/bin/env perl -w

# Copyright (C) 2005-2009, Sebastian Riedel.

use strict;
use warnings;

use ExtUtils::MakeMaker;

# Son, when you participate in sporting events,
# it's not whether you win or lose, it's how drunk you get.
WriteMakefile(
    NAME         => 'Text::SimpleTable',
    VERSION_FROM => 'lib/Text/SimpleTable.pm',
    AUTHOR       => 'Sebastian Riedel <sri@cpan.org>'
);
