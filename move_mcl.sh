#! /bin/bash

vtc MoveTables -workflow=soda2messages soda messages '{"main_messagingchannellist":{}}'
vtc VDiff messages.soda2messages
vtc SwitchReads -tablet_type=rdonly messages.soda2messages
vtc SwitchReads -tablet_type=replica messages.soda2messages
vtc SwitchWrites messages.soda2messages
vtc DropSources messages.soda2messages