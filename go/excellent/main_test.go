package main

import "testing"

func TestEventOrOdd(t *testing.T) {
	result := EventOrOdd(10)
	if result != "event" {
		t.Errorf("expected: event, actual: %s", result)
	}
}