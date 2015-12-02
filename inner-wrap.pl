use strict;
use argola;
my $zaga;
my @zagb;
my $zagc;
my $zagd; # Ultimate Closing Form:

system("date");


$zaga = `ls -1d *-f.txt`;
@zagb = split(/\n/,$zaga);
foreach $zagc (@zagb)
{
  if ( -f $zagc )
  {
    $zagd = $zagc;
    chop($zagd); chop($zagd); chop($zagd);
    chop($zagd); chop($zagd); chop($zagd);
    &lev_aa($zagd);
  }
}

sleep(2);
exec("nfs-edit-catch");


sub lev_aa {
  my $lc_lbas;
  my $lc_checkout; # Checkout file:
  my $lc_forko; # Fork variable:
  my $lc_ftyp; # File type
  my $lc_comd; # Shell-prep comd
  
  $lc_lbas = $_[0];
  $lc_checkout = $lc_lbas . "-co.txt";
  
  if ( -f $lc_checkout ) { return; }
  system("touch",$lc_checkout);
  $lc_forko = fork();
  if ( !(defined($lc_forko)) )
  {
    system("rm","-rf",$lc_checkout);
    return;
  }
  if ( $lc_forko > 0.5 ) { return; }
  
  $lc_comd = "cat";
  &argola::wraprg_lst($lc_comd,$lc_lbas . "-b.txt");
  $lc_ftyp = `$lc_comd`; chomp($lc_ftyp);
  
  if ( $lc_ftyp eq "txt" )
  {
    system("edit","-w",$lc_lbas . "-e." . $lc_ftyp);
    &terminoso();
  }
  
  &terminoso();
}

sub terminoso {
  system("rm","-rf",$zagd . "-f.txt"); sleep(8);
  system("rm","-rf",$zagd . "-co.txt");
  exit(0);
}

