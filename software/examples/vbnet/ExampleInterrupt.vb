Imports System
Imports Tinkerforge

Module ExampleInterrupt
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Industrial Digital In 4 Bricklet

    ' Callback subroutine for interrupt callback
    Sub InterruptCB(ByVal sender As BrickletIndustrialDigitalIn4, _
                    ByVal interruptMask As Integer, ByVal valueMask As Integer)
        Console.WriteLine("Interrupt Mask: " + Convert.ToString(interruptMask, 2))
        Console.WriteLine("Value Mask: " + Convert.ToString(valueMask, 2))
        Console.WriteLine("")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim idi4 As New BrickletIndustrialDigitalIn4(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register interrupt callback to subroutine InterruptCB
        AddHandler idi4.InterruptCallback, AddressOf InterruptCB

        ' Enable interrupt on pin 0
        idi4.SetInterrupt(1 << 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
