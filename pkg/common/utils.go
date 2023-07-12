package common

import (
	"bufio"
	"bytes"
	"io"
	"strings"
)

func AddStringSliceItem(item string, slice *[]string) {
	for _, i := range *slice {
		if i == item {
			return
		}
	}
	*slice = append(*slice, item)
}

func RemoveStringSliceItem(item string, slice *[]string) {
	for i, listItem := range *slice {
		if item == listItem {
			(*slice)[i] = (*slice)[len(*slice)-1]
			*slice = (*slice)[:len(*slice)-1]
		}
	}
}

func MinInt(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func BytesEqual(a, b []byte, numBytes int) bool {
	limit := MinInt(numBytes, MinInt(len(a), len(b))-1)
	return bytes.Equal(a[:limit], b[:limit])
}

func ResponseContainsSubstring(reader io.ReadCloser, target string) (bool, error) {
	scanner := bufio.NewScanner(reader)
	for scanner.Scan() {
		if strings.Contains(scanner.Text(), target) {
			return true, nil
		}
	}
	if err := scanner.Err(); err != nil {
		return false, err
	}
	return false, nil
}
