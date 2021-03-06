#include "otr.h"
char *otr_help = "- OTR help -\nQuick start:  Do \"/load otr\"  (irssi syntax), write  \"?OTR?\" to your  OTR buddy,\nwait until the now ongoing key  generation finishes and write \"?OTR?\" again. You\nshould \"go secure\".\n\nKey generation happens in a separate  process and its duration mainly depends on\nthe available entropy. On  my desktop it takes about 6  Minutes, about 2 Minutes\nif I run  \"du /\" in parallel  and on an idle  server system it can  even take an\nhour.\n\nThe  default  OTR  policy  of  irc-otr  is  now  something  between  manual  and\nopportunistic. Manual  means you have to  start it yourself by  issuing \"?OTR?\",\nopportunistic means  both peers send  some magic  whitespace and start  OTR once\nthey receive this whitespace from the other side. irc-otr uses a mode in between\nwhere we are not sending whitespace as an announcement (as in opportunistic) but\nwe still  handle whitespace if  we see  it from the  other side (I'm  calling it\nhandlews). Therefore if your peer  uses opportunistic the handshake should still\nstart automatically once he writes something.\n\nYou can  now set the  OTR policy  per peer via  the otr_policy /setting.  It's a\ncomma separated  list of \"<nick>@<server> <policy>\"  pairs where <nick>@<server>\nis interpreted as a glob pattern, i.e. you can use wildcard \"*\" and joker \"?\" as\nyou would  in a shell.  The policy  can be one  of never, manual,  handlews (the\ndefault),  opportunistic, and  always. Be  aware that  the opportunistic  policy\nfails with  some IRC  servers since  they strip off  the whitespace.  The always\npolicy has  the nice side effect  that the first  line you type will  already be\nencrypted.\n\nIf  a  fingerprint can  be  found  for someone,  i.e.  someone  you had  an  OTR\nconversation  with  before,  then  the otr_policy_known  setting  applies  after\notr_policy. It has the same syntax. The  default is \"* always\", i.e. enforce OTR\nwith anyone you've used OTR with before.\n\nShould you finish an OTR session via  \"/otr finish\" and should the active policy\nbe always  or opportunistic then  it will be  temporarily set back  to handlews.\nOtherwise OTR would start again right away  which is probably not what you want.\nThis is however reset once you close the query window.\n\nTo make  sure that you are  actually talking to your  buddy, you can agree  on a\nsecret somehow  and then one does  \"/otr auth <secret>\". Shortly  afterwards the\nother  one will  be  asked to  do  the  same and  you're  done. The  traditional\nalternative, comparing  fingerprints over a secure  line, can also be  used. Use\n\"/otr trust\" once you're sure they match.\n\nI also  strongly recommend to do  \"/statusbar window add otr\"  (irssi syntax) so\nyou're informed about what's going on.\n\nIn \"<client config dir>/otr/otr.{key,fp}\" you'll  find the fingerprints and your\nprivate keys(should you at any point be interested).\n\nCommands:\n\n/otr genkey nick@irc.server.com \n        Manually generate a key for the given account(also done on demand)\n/otr auth [<nick>@<server>] <secret>\n        Initiate or respond to an authentication challenge\n/otr authabort [<nick>@<server>] \n        Abort any ongoing authentication\n/otr trust [<nick>@<server>]\n        Trust the fingerprint of the user in the current window.\n        You should only do this after comparing fingerprints over a secure line\n/otr debug\n        Switch debug mode on/off\n/otr contexts\n        List all OTR contexts along with their fingerprints and status\n/otr finish [<nick>@<server>]\n        Finish an OTR conversation\n/otr version\n        Display irc-otr version. Might be a git commit\n\nSettings:\n\notr_policy\n        Comma-separated list of \"<nick>@<server> <policy>\" pairs. See comments\n        above.\notr_policy_known\n        Same syntax as otr_policy. Only applied where a fingerprint is\n        available.\notr_ignore\n        Conversations with nicks that match this regular expression completely\n        bypass libotr. It is very unlikely that you need to touch this setting,\n        just use the OTR policy never to prevent OTR sessions with some nicks.\notr_finishonunload\n        If true running OTR sessions are finished on /unload and /quit.\notr_createqueries\n        If true queries are automatically created for OTR log messages.\n- End of OTR help -";
FORMAT_REC formats[] = {
{ MODULE_NAME, "otr", 0}
,
{ NULL, "Keys", 0 }
,
{ "kg_failed", "Key generation for %s: failed: %s (%s)", 0},
{ "kg_completed", "Key generation for %s: completed in %d seconds. Reloading keys", 0},
{ "kg_aborted_dup", "Key generation for %s: aborted. Key generation for %s still in progress", 0},
{ "kg_aborted_dir", "Key generation for %s: aborted, failed creating directory %s: %s", 0},
{ "kg_mkdir", "created directory %s", 0},
{ "kg_pipe", "Key generation for %s: error creating pipe: %s", 0},
{ "kg_fork", "Key generation for %s: fork() error: %s", 0},
{ "kg_initiated", "Key generation for %s: initiated. This might take several minutes or on some systems even an hour. If you wanna check that something is happening, see if there are two processes of your IRC client.", 0},
{ "kg_exited", "Key generation for %s: child terminated for unknown reason", 0},
{ "kg_exitsig", "Key generation for %s: child was killed by signal %s", 0},
{ "kg_pollerr", "Key generation for %s: error poll()ing child: %s", 0},
{ "kg_abort", "Key generation for %s: aborted", 0},
{ "kg_needacc", "I need an account name. Try something like /otr genkey mynick@irc.server.net", 0},
{ "kg_noabort", "No ongoing key generation to abort", 0},
{ "key_not_found", "no private keys found", 0},
{ "key_loaded", "private keys loaded", 0},
{ "key_load_error", "Error loading private keys: %s (%s)", 0},
{ NULL, "Fingerprints", 0 }
,
{ "fp_saved", "fingerprints saved", 0},
{ "fp_save_error", "Error saving fingerprints: %s (%s)", 0},
{ "fp_not_found", "no fingerprints found", 0},
{ "fp_loaded", "fingerprints loaded", 0},
{ "fp_load_error", "Error loading fingerprints: %s (%s)", 0},
{ "fp_trust", "Trusting fingerprint from %s", 0},
{ NULL, "Callbacks", 0 }
,
{ "ops_notify_bug", "BUG() in ops_notify", 0},
{ "ops_notify", "title: %s prim: %s sec: %s", 0},
{ "ops_display_bug", "BUG() in ops_display", 0},
{ "ops_display", "msg: %s", 0},
{ "ops_sec", "gone secure", 0},
{ "ops_fpcomp", "Your peer is not authenticated. To make sure you're talking to the right guy you can either agree on a secret and use the authentication described in /otr auth, or use the traditional way and compare fingerprints over a secure line (e.g. telephone) and subsequently enter /otr trust.  Your fingerprint is: %s. %s's fingerprint: %s", 0},
{ "ops_insec", "gone insecure", 0},
{ "ops_still_reply", "still secure (is reply)", 0},
{ "ops_still_no_reply", "still secure (is not reply)", 0},
{ "ops_log", "log msg: %s", 0},
{ "ops_inject", "Couldn't inject message from %s for %s: %s", 0},
{ NULL, "SendingReceiving", 0 }
,
{ "send_failed", "send failed: msg=%s", 0},
{ "send_change", "couldn't find context also OTR changed the outgoing message(BUG?)", 0},
{ "send_fragment", "failed to fragment message: msg=%s", 0},
{ "send_converted", "OTR converted sent message to %s", 0},
{ "receive_ignore_query", "ignoring rest of OTR default query msg", 0},
{ "receive_dequeued", "dequeued msg of length %d", 0},
{ "receive_queued", "queued msg of length %d", 0},
{ "receive_ignore", "ignoring protocol message of length %d, acc=%s, from=%s: %s", 0},
{ "receive_converted", "OTR converted received message", 0},
{ "otr_better_two", "<b>%s</b> has requested an <a href=\"http://otr.cypherpunks.ca/\">Off-the-Record private conversation</a>.  However, you do not have a plugin to support that.", 0},
{ "otr_better_three", "See <a href=\"http://otr.cypherpunks.ca/\">http://otr.cypherpunks.ca/</a> for more information.", 0},
{ NULL, "Context", 0 }
,
{ "ctx_not_found", "couldn't find context: acc=%s nick=%s", 0},
{ "ctx_not_create", "couldn't create/find context: acc=%s from=%s", 0},
{ NULL, "Authentication", 0 }
,
{ "auth_aborted_ongoing", "Ongoing authentication aborted", 0},
{ "auth_aborted", "Authentication aborted", 0},
{ "auth_responding", "Responding to authentication request...", 0},
{ "auth_initiated", "Initiated authentication...", 0},
{ "auth_have_old", "%s wanted to authenticate but an old authentication was still ongoing.  Old authentication will be aborted, please try again.", 0},
{ "auth_peer", "%s wants to authenticate. Type /otr auth <your-shared-secret> to complete.", 0},
{ "auth_peer_reply_wrong", "%s replied to an auth we didn't start.", 0},
{ "auth_peer_replied", "%s replied to our auth request...", 0},
{ "auth_peer_wrong_smp3", "%s sent a wrong authentication message (SMP3).", 0},
{ "auth_peer_wrong_smp4", "%s sent a wrong authentication message (SMP4).", 0},
{ "auth_successful", "Authentication successful!", 0},
{ "auth_failed", "Authentication failed!", 0},
{ "auth_needenc", "You need to establish an OTR session before you can authenticate.", 0},
{ NULL, "Commands", 0 }
,
{ "cmd_otr", "We're alive", 0},
{ "cmd_qnotfound", "Failed: Can't get nick and server of current query window. (Or maybe you're doing this in the status window?)", 0},
{ "cmd_auth", "Please agree on a secret with your peer and then initiate the authentication with /otr auth <secret> or let him initiate. Should you initiate your peer will after a little while be instructed to enter the secret as well. Once he has done so the authentication will finish up. Should you have both typed in the same secret the authentication should be successful.", 0},
{ "cmd_debug_on", "Debug mode is on", 0},
{ "cmd_debug_off", "Debug mode is off", 0},
{ "cmd_finish", "Finished conversation with %s@%s.", 0},
{ "cmd_finishall_none", "No conversations to finish.", 0},
{ "cmd_version", "This is irc-otr version %s", 0},
{ "peer_finished", "%s has finished the OTR conversation. If you want to continue talking enter /otr finish for plaintext or ?OTR? to restart OTR.", 0},
{ NULL, "Contexts", 0 }
,
{ "ctx_ctx_unencrypted", "%20s    %30s    plaintext", 0},
{ "ctx_ctx_encrypted", "%20s    %30s    encrypted", 0},
{ "ctx_ctx_finished", "%20s    %30s    finished", 0},
{ "ctx_ctx_unknown", "%20s    %30s    unknown state(BUG?)", 0},
{ "ctx_fps_no", "%s %rnot authenticated", 0},
{ "ctx_fps_smp", "%s authenticated via shared secret (SMP)", 0},
{ "ctx_fps_man", "%s authenticated manually", 0},
{ "ctx_noctxs", "No active OTR contexts found", 0},
{ NULL, "Statusbar", 0 }
,
{ "st_plaintext", "{sb plaintext}", 0},
{ "st_untrusted", "{sb %rOTR(not auth'ed)}", 0},
{ "st_trust_smp", "{sb OTR}", 0},
{ "st_trust_manual", "{sb OTR}", 0},
{ "st_smp_incoming", "{sb {hilight incoming auth request...}}", 0},
{ "st_smp_outgoing", "{sb {hilight awaiting auth reply...}}", 0},
{ "st_smp_finalize", "{sb {hilight finalizing auth...}}", 0},
{ "st_smp_unknown", "{sb {hilight unknown auth state!}}", 0},
{ "st_finished", "{sb finished}", 0},
{ "st_unknown", "{sb {hilight state unknown (BUG!)}}", 0},
{ NULL, NULL, 0 }
};
