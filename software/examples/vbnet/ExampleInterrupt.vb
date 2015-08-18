Imports Tinkerforge

Module ExampleInterrupt
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback function for interrupts
    Sub InterruptCB(ByVal sender As BrickletIndustrialDigitalIn4, _
                    ByVal interruptMask As Integer, ByVal valueMask As Integer)
        Dim interruptBinary As String = System.Convert.ToString(interruptMask, 2)
        Dim valueBinary As String = System.Convert.ToString(valueMask, 2)

        System.Console.WriteLine("Interrupt by: " + interruptBinary)
        System.Console.WriteLine("Value: " + valueBinary)
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim idi4 As New BrickletIndustrialDigitalIn4(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register callback for interrupts
        AddHandler idi4.Interrupt, AddressOf InterruptCB

        ' Enable interrupt on pin 0
        idi4.SetInterrupt(1 << 0)

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
