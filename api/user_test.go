package api

import (
	db "SIMPLEBANK/db/sqlc"
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/techschool/simplebank/util"
)

func randomUser(t *testing.T) (user db.User, password string) {
	password = util.RandomString(6)
	hashedPassword, err := util.HashPassword(password)
	require.NoError(t, err)

	user = db.User{
		Username:       util.RandomOwner(),
		HashedPassword: hashedPassword,
		FullName:       util.RandomOwner(),
		Email:          util.RandomEmail(),
	}
	return
}