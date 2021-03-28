#https://codertw.com/%E5%89%8D%E7%AB%AF%E9%96%8B%E7%99%BC/392291/    sed web resource
#my @oldFolder = `ls -t|sed -rn '/anneal[0-9]{3}/p'`;#r for re extension
#https://onlinemschool.com/math/assistance/vector/multiply1/
use Cwd;
my $pwd = getcwd();
print "pwd: $pwd\n";
@elements =(["Al1","fcc","4.0","x 1 0 0","y 1 0 0","z 1 0 0"],
			["Al2","fcc","5.0","x 1 1 1","y 1 -1 0","z 0.5 0.5 -1"]
			);
for (0..$#elements){
	my $lmpfile = join ("-",@{$elements[$_]}[0..1]).".in";
	unlink $lmpfile;# remove old one
	system ("cp $elements[$_][1].in $lmpfile");
	my $orientation = " orient " . join (" orient ",@{$elements[$_]}[3..5]);
	my $lattice_line = "lattice $elements[$_][1] $elements[$_][2]"."$orientation";
	print "$_: $lattice_line\n";
`sed -i 's:^lattice.*:$lattice_line:' "$pwd/$lmpfile"`;
### system("lmp_mpi -in  $lmpfile");	
}

