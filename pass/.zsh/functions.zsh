#!/bin/bash

__home=$1
alias passcli="pass"
otpgen() {
  issue=$1
  name=$2
  secret=$3
  echo "otpauth://totp/$issue:$name?issuer=$issue&secret=$secret&algorithm=SHA1&digits=6&period=30" | pbcopy
}

otp() {
  name=$1
  otp_text=$(pass otp $name/otp)
  echo $otp_text | pbcopy
  echo $name otp copied to clipboard!
}

otpqr() {
  name=$1
  pass otp uri -q $name/otp
}
