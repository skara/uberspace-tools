# Configuration

WRITELOG="1"
SPAMASSASSIN_ENABLE="1"
SPAMASSASSIN_MINSPAMSCORE="5"
DSPAM_ENABLE="1"
SILENT_SPAM="0"

# ------------------------------------------------------

# Write log file, if desrired. Set Maildir. Handle Spam.
include "$HOME/.mailfilters/writelog"
include "$HOME/.mailfilters/checkmaildir"
include "$HOME/.mailfilters/handlespam"


# Set default destination Maildir
DESTDIR="$MAILDIR"
SILENT_DESTDIR="0"

# ------------------------------------------------------
# Here go the filter rules...
# ------------------------------------------------------

# Finally, deliver mail
include "$HOME/.mailfilters/deliver"