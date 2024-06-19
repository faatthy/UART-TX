## UART TX 

## UART Overview
![image](https://github.com/faatthy/UART-TX/assets/110846097/afb5d129-3b0c-4a2a-be42-3dcfd84c8523)
 - Transmitting UART converts parallel data from the master device (eg. 
CPU) into serial form and transmit in serial to receiving UART.
- Receiving UART will then convert the serial data back into parallel data 
for the receiving device.

## Block Interface
![image](https://github.com/faatthy/UART-TX/assets/110846097/18bba60c-6c5e-4c50-bdaa-cb81eab8bbf5)

## Data Details
<table>
    <tr>
        <th>Port</th>
        <th>Width</th>
        <th>Description</th>
    </tr>
    <tr>
        <td style="color: red;">CLK</td>
        <td>1</td>
        <td>UART TX Clock Signal</td>
    </tr>
    <tr>
        <td style="color: red;">RST</td>
        <td>1</td>
        <td>Synchronized reset signal</td>
    </tr>
    <tr>
        <td style="color: red;">PAR_TYP</td>
        <td>1</td>
        <td>Parity Type</td>
    </tr>
    <tr>
        <td style="color: red;">PAR_EN</td>
        <td>1</td>
        <td>Parity_Enable</td>
    </tr>
    <tr>
        <td style="color: red;">P_DATA</td>
        <td>Parameterized (Default = 8)</td>
        <td>Input data byte</td>
    </tr>
    <tr>
        <td style="color: red;">DATA_VALID</td>
        <td>1</td>
        <td>Input data valid signal</td>
    </tr>
    <tr>
        <td style="color: red;">TX_OUT</td>
        <td>1</td>
        <td>Serial Data OUT</td>
    </tr>
    <tr>
        <td style="color: red;">Busy</td>
        <td>1</td>
        <td>High signal during transmission, otherwise low</td>
    </tr>
</table>

## Specs
- UART TX receive the new data on P_DATA Bus only when 
Data_Valid Signal is high.  
- Registers are cleared using asynchronous active low reset 
- Data_Valid is high for only 1 clock cycle 
- Busy signal is high as long as UART_TX is transmitting the frame, 
otherwise low. 
- UART_TX couldn't accept any data on P_DATA during UART_TX 
processing, however Data_Valid get high. 
- S_DATA is high in the IDLE case (No transmission). 
- PAR_EN (Configuration) 
0: To disable frame parity bit 
1: To enable frame parity bit 
 PAR_TYP (Configuration) 
0: Even parity bit 
1: Odd parity bit 
