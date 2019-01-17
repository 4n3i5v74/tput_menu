use Text::SimpleTable::AutoWidth;
 
my $t1 = Text::SimpleTable::AutoWidth->new();
$t1->row( 'foobarbaz', 'yadayadayada' );
print $t1->draw;
