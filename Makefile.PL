
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  'ABSTRACT' => 'wxWidgets support for Padre',
  'AUTHOR' => 'Ahmad M. Zawawi <ahmad.zawawi@gmail.com>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'Locale::Msgfmt' => '0.15',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'File::ShareDir::Install' => '0.03'
  },
  'DISTNAME' => 'Padre-Plugin-WxWidgets',
  'EXE_FILES' => [
    'bin/parse_wxwidgets_docs'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Padre::Plugin::WxWidgets',
  'PREREQ_PM' => {
    'Archive::Extract' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'Getopt::Long' => '0',
    'HTML::FormatText' => '0',
    'HTML::Parse' => '0',
    'HTTP::Request' => '0',
    'LWP::UserAgent' => '0',
    'Padre' => '0.57',
    'Padre::Plugin' => '0',
    'Padre::Wx' => '0'
  },
  'VERSION' => '0.03',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

package
MY;
use File::ShareDir::Install qw(postamble);


