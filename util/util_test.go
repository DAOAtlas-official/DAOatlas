package util

import "testing"

func Test_Md5jiayan(t *testing.T) {
	pass := Md5jiayan("123123")
	t.Log(pass)
}
