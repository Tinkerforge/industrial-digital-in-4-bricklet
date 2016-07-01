Imports System
Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Industrial Digital In 4 Bricklet

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim idi4 As New BrickletIndustrialDigitalIn4(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get current value as bitmask
        Dim valueMask As Integer = idi4.GetValue()
        Console.WriteLine("Value Mask: " + Convert.ToString(valueMask, 2))

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
