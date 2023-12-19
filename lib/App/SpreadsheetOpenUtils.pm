package App::SpreadsheetOpenUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

our %SPEC;

$SPEC{open_spreadsheet} = {
    v => 1.1,
    args => {
        paths_or_urls => {
            'x.name.is_plural' => 1,
            'x.name.singular' => 'path_or_url',
            schema => ['array*', of=>'str*'],
            req => 1,
            pos => 0,
            slurpy => 1,
        },
        #all => {
        #    schema => 'true*',
        #},
    },
    features => {
        dry_run => 1,
    },
};
sub open_spreadsheet {
    require Spreadsheet::Open;

    my %args = @_;
    for my $path_or_url (@{ $args{paths_or_urls} }) {
        if ($args{-dry_run}) {
        } else {
            log_trace "Opening %s ...", $path_or_url;
            Spreadsheet::Open::open_spreadsheet($path_or_url);
        }
    }
    [200];
}

1;
# ABSTRACT: Utilities related to Spreadsheet::Open

=head1 SYNOPSIS


=head1 DESCRIPTION

This distribution includes several utilities:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<Spreadsheet::Open>
