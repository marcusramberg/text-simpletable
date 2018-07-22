#!/usr/bin/env perl

# Copyright (C) 2005-2010, Sebastian Riedel.

use strict;
use warnings;
use utf8;

use Test::More;

eval "use Unicode::GCString";
if ($@) {
    plan skip_all => "These tests require Unicode::GCString";
}
else {
   plan tests => 2;
}

binmode STDERR, ":utf8";
binmode STDOUT, ":utf8";

use_ok('Text::SimpleTable');

my $t = Text::SimpleTable->new(10,11);
$t->row("あいうえおかきくけこ", "あいうえおかきくけこ");
$t->hr;
$t->row("あいうえおかきくけこa", "あいうえおかきくけこa");
$t->hr;
$t->row("あいうえおかきくけこab", "あいうえおかきくけこab");
$t->hr;
$t->row("xあいうえおかきくけこ", "xあいうえおかきくけこ");
$t->hr;
$t->row("xyあいうえおかきくけこ", "xyあいうえおかきくけこ");
is($t->draw, <<EOF, 'right table');
.------------+-------------.
| あいうえ-  | あいうえお- |
| おかきく-  | かきくけこ  |
| けこ       |             |
+------------+-------------+
| あいうえ-  | あいうえお- |
| おかきく-  | かきくけこa |
| けこa      |             |
+------------+-------------+
| あいうえ-  | あいうえお- |
| おかきく-  | かきくけこ- |
| けこab     | ab          |
+------------+-------------+
| xあいうえ- | xあいうえ-  |
| おかきく-  | おかきくけ- |
| けこ       | こ          |
+------------+-------------+
| xyあいう-  | xyあいうえ- |
| えおかき-  | おかきくけ- |
| くけこ     | こ          |
'------------+-------------'
EOF
