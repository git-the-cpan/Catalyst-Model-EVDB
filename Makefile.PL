use ExtUtils::MakeMaker;

WriteMakefile(
    NAME      => 'Catalyst::Model::EVDB',
    AUTHOR    => 'Daniel Westermann-Clark <danieltwc@cpan.org>',
    PREREQ_PM => {
        Catalyst  => '5.5',
        EVDB::API => 0,
    },
    VERSION_FROM => 'lib/Catalyst/Model/EVDB.pm'
);


package MY;

sub postamble {
    return <<"...";
cover::
	cover -delete
	HARNESS_PERL_SWITCHES=-MDevel::Cover \$(MAKE) test
	cover

readme::
	perldoc -o text -d README \$(NAME)
...
}

1;
