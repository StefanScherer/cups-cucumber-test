Feature: Testing LPR jobs on multiple VMs

  Scenario: Check we have all VMs setup correctly

    Given there is a running VM called "spooler"
    And there is a running VM called "client"

    Then running the shell command `which rlpr` on the VM called "client" should succeed
    Then the stdout of that shell command should match /\/usr\/bin\/rlpr/
    Then running the shell command `service cups status` as root on the VM "spooler" should succeed
    Then the stdout of that shell command should match /running/


  @vagrant-cucumber-debug
  Scenario: Check we can print a simple file with rlpr

    Given there is a running VM called "spooler"
    And there is a running VM called "client"

    When I run the shell command `nc -d -l 12345 > /tmp/received &` on the VM called "client"
    Then running the shell command `echo test > /tmp/testfile` on the VM called "client" should succeed
    Then running the shell command `rlpr -h -N -Hspooler -Ppingpong /tmp/testfile` on the VM called "client" should succeed
    Then running the shell command `diff /tmp/testfile /tmp/received` should succeed
    And the stdout of that shell command should match /^$/

