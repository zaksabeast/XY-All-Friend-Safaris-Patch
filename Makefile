.PHONY: patch clean

patch:
	@armips main.s
	@flips -c code.bin code_patched.bin code.ips

clean:
	@rm code_patched.bin code.ips
