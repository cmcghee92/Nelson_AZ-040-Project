# AZ-040-Project
This is my first repo that was cloned from GitHub

#Adatum-Foreach
# Adatum PowerShell Foreach Challenges

**Student Name:** Nelson Tanyi 
**Lab Environment:** LON-CL1 (Windows 10, PowerShell 5.1, Active Directory Module)

---

### Challenge 01: List the lab computers
- **Run Location:** LON-CL1
- **Observed Result:** Displayed exactly three lines: `Computer: LON-CL1`, `Computer: LON-DC1`, and `Computer: LON-SVR1`.
- **Validation:** Output matched the expected format exactly using a `foreach` loop.
- **Reflection Answer:** The `$computers` variable contains the whole collection (the array). The `$computer` variable contains one item at a time during each iteration of the loop.

### Challenge 02: Build domain qualified names
- **Run Location:** LON-CL1
- **Observed Result:** Displayed `LON-CL1.Adatum.com`, `LON-DC1.Adatum.com`, and `LON-SVR1.Adatum.com`.
- **Validation:** String expansion successfully concatenated the computer name and domain variable with a dot.
- **Reflection Answer:** No. Printing a domain-qualified name is just text concatenation. It does not prove the computer exists in DNS, is powered on, or is reachable on the network.

### Challenge 03: Inspect local services
- **Run Location:** LON-CL1
- **Observed Result:** Displayed three lines with the requested service names (EventLog, W32Time, Spooler) and their actual current statuses (e.g., Running or Stopped).
- **Validation:** Output correctly showed the `Name` and `Status` properties for all three services without altering their state.
- **Reflection Answer:** Service status can differ between students because lab VMs may be in different states, a service might have been manually stopped/started by a user, or trigger-start services may not have activated yet.

### Challenge 04: Count local services
- **Run Location:** LON-CL1
- **Observed Result:** Displayed one name per service, followed by a total count that matched the `Count` property of the captured `$allServices` array.
- **Validation:** The final total printed matched the actual number of services on the system.
- **Reflection Answer:** If you reset the counter inside the loop (e.g., `$total = 0`), it will reset to zero on every single iteration. The final output would always be `1`, as it would only count the very last item processed.

### Challenge 05: Read the domain computer inventory
- **Run Location:** LON-CL1
- **Observed Result:** Displayed three AD computer records with Name, DNSHostName, and OperatingSystem.
- **Validation:** LON-CL1 correctly identified as Windows 10 and LON-SVR1 as Windows Server 2019 (based on lab attribute population).
- **Reflection Answer:** This is a directory information query. It reads the attributes stored statically in Active Directory, not a live query of the operating system itself (which would require WMI/CIM).

### Challenge 06: Flag local services for review
- **Run Location:** LON-CL1
- **Observed Result:** Displayed one "OK" or "REVIEW" line per service, plus a final REVIEW total between zero and three.

### Challenge 07: Summarize domain user account states
- **Run Location:** LON-CL1
- **Observed Result:** Displayed each user's `SamAccountName` with an Enabled or Disabled status, followed by the enabled count, disabled count, and total captured users.
- **Validation:** The enabled and disabled counts added up exactly to the total captured user count, proving the logic was sound.
- **Reflection Answer:** The `Enabled` property tells you if the account is permitted to authenticate in Active Directory. It does **not** tell you if the user is currently signed in, if their password is expired, or if the account is temporarily locked out due to failed login attempts.

### Challenge 08: Test lab network responses
- **Run Location:** LON-CL1
- **Observed Result:** Displayed three result lines (ICMP reply or No ICMP reply) for the FQDNs, and a reply count from zero to three.
- **Validation:** The script correctly used `-Quiet` to get a Boolean result and handled potential timeouts with `-ErrorAction SilentlyContinue` without throwing red errors.
- **Reflection Answer:** No. An ICMP reply only proves network-layer reachability and that ICMP traffic is not blocked by a firewall. It does not prove that PowerShell Remoting (WinRM on ports 5985/5986) is configured, running, or permitted.

### Challenge 09: Export a computer account report
- **Run Location:** LON-CL1
- **Observed Result:** Generated a uniquely named CSV file in the script directory containing four headers (`ComputerName`, `DNSHostName`, `OperatingSystem`, `AccountState`) and exactly three data rows.
- **Validation:** Running `Import-Csv` on the generated file returned exactly three objects, confirming the data was structured and saved correctly.
- **Reflection Answer:** You should export objects instead of formatted strings because objects retain their data structure and types. This allows other scripts or tools (like `Import-Csv`) to reliably read and process the data. Formatted strings are for human eyes only and break automated parsing.

### Challenge 10: Review services on the member server
- **Run Location:** LON-CL1 (Targeting LON-SVR1.Adatum.com)
- **Observed Result:** *(Choose one based on your lab outcome)* 
  - *Success:* Displayed three service lines identifying LON-SVR1.Adatum.com with OK/REVIEW status.
  - *Fallback:* Displayed a clear `QUERY FAILED` line with the actual error message (or ran locally on LON-SVR1 as a LOCAL FALLBACK).
- **Validation:** The `try/catch` block successfully handled the remote execution attempt, and the nested loop correctly evaluated the status of each returned service object.
