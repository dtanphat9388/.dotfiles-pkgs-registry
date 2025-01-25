#!/bin/bash

psql_brew() {
	brew tap mongodb/brew
	brew install mongodb-database-tools mongosh
}

psql_apt() {
	return
}

if [[ $DF_IS_HOMEBREW ]]; then
	psql_brew
elif [[ $DF_IS_APT ]]; then
	psql_apt
fi
