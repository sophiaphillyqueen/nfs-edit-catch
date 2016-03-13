use strict;
use argola;
my $zaga;
my @zagb;
my $zagc;
my $zagd; # Ultimate Closing Form:
my $live_file_set = ( 1 > 2 );
my $live_file_at;
my @recurs_cmd;
my $cool_to_go;

system("date");

sub opto__live_do {
  $live_file_at = &argola::getrg();
  system("echo","Set file: " . $live_file_at . ":");
  $live_file_set = ( 2 > 1 );
} &argola::setopt('-live',\&opto__live_do);

&argola::runopts;


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
$cool_to_go = ( 2 > 1 );
@recurs_cmd = ("nfs-edit-catch");
if ( $live_file_set )
{
  @recurs_cmd = (@recurs_cmd,'-live',$live_file_at);
  system("echo","Reaffirming Live File: " . $live_file_at . ":");
  $cool_to_go = ( -f $live_file_at );
}

if ( $cool_to_go ) { exec(@recurs_cmd); }
exit(0);

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

