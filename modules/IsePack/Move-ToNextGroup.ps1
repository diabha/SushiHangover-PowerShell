function Move-ToNextGroup {    
    <#
    .Synopsis
        Moves to the next grouping token ({}) in the current script           
    .Description
        Moves to the next grouping token ({}) in the current script                   
    .Example
        Move-toNextGroup
    #>
    
    $allTokens = Get-CurrentOpenedFileToken
    $currentToken = Get-CurrentToken 
    if ($currentToken -and $allTokens) {
        $c = 0
        for($i = 0; $i -lt $allTokens.Count; $i++) {
            if ($allTokens[$i].StartLine -eq $currentToken.StartLine -and
                $allTokens[$i].StartColumn -eq $currentToken.StartColumn) {
                for ($j = $i + 1; $j -lt $allTokens.Count; $j++) {
                    if ("GroupStart", "GroupEnd" -contains $allTokens[$j].Type) {
                        $psise.CurrentFile.Editor.SetCaretPosition($allTokens[$j].StartLine, $allTokens[$j].StartColumn + 1)
                        return
                    }
                }
            }
        }
    }
}
