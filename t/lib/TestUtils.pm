package TestUtils;

use strict;
use warnings;

use File::Spec;
use File::Path;
use Parse::BACKPAN::Packages;

use base "Exporter";
our @EXPORT = qw(new_backpan);


# The local cache directory for testing
sub cache_dir {
    return File::Spec->rel2abs("t/cache");
}


# Delete the local cache directory
sub clear_cache {
    rmtree cache_dir();
}


# Determine if we should download the remote index or
# use the local one that comes with the distribution.
use URI::file;
use File::Spec::Unix;
my $remote_index = "http://www.astray.com/tmp/backpan.txt.gz";
my $local_index  = URI::file->new( File::Spec::Unix->rel2abs("t/backpan.txt.gz") );
sub backpan_index_url {
    use LWP::Simple;
    return head($remote_index) ? $remote_index : $local_index;
}


# Init a new Parse::BACKPAN::Packages object with the right options for testing
sub new_backpan {
    my $cache_dir = File::Spec->rel2abs("t/cache");
    return Parse::BACKPAN::Packages->new({
        cache_dir               => $cache_dir,
        backpan_index_url       => backpan_index_url(),
        @_
    });
}

1;
