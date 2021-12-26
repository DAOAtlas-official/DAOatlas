package dao

import "testing"

func Test_GetPostsByTagID(t *testing.T) {
	data, err := GetPostsByTagID(13, 0, 15)
	t.Log(data, err)
}
