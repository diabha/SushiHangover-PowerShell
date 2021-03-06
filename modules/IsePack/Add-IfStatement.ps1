function Add-IfStatement
{
    <#
    .Synopsis
        Adds an if Statement to the ISE
    .Description
        Adds an if Statement to the ISE
    .Example
        Add-IfStatement
    #>

    $l = $psise.CurrentFile.Editor.CaretLine
    $c = $psise.CurrentFile.Editor.CaretColumn
    $x = ''
    if ($c -ne 0)
    {
        $x = ' ' * ($c - 1)
    }
    $psise.CurrentFile.Editor.InsertText("if() {`n" + $x + "`n" + $x + "}")
    $psise.CurrentFile.Editor.SetCaretPosition($l, $c + 3)    
}
