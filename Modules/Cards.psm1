class Cards {

    [System.Collections.Generic.List[string]]$cards
    [string]$name

    Cards([string]$_name) {
        $this.name = $_name
        $this.cards = [System.Collections.Generic.List[string]]::new()
    }

    NewDeck() {
        $_suits = "`u{2663}", "`u{2666}", "`u{2665}", "`u{2660}"
        $_values = 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'
        
        $_deck = foreach ($s in $_suits) { foreach ($v in $_values) { "$v$s" } }
        $this | Update-List -Property cards -Add $_deck | Out-Null
    }
    
    Show() {
        Write-Host
        Write-Host $this.name ":::: " $this.cards[0..12]
        switch ($true) {
            ($this.cards.count -gt 13) { Write-Host (' ' * ($this.name.length + 3)) $this.cards[13..25] }
            ($this.cards.count -gt 26) { Write-Host (' ' * ($this.name.length + 3)) $this.cards[26..38] }
            ($this.cards.count -gt 13) { Write-Host (' ' * ($this.name.length + 3)) $this.cards[13..25] }
            ($this.cards.count -gt 26) { Write-Host (' ' * ($this.name.length + 3)) $this.cards[26..38] }
            ($this.cards.count -gt 39) { Write-Host (' ' * ($this.name.length + 3)) $this.cards[39..51] }
        }
    }

    Shuffle() {  $this.cards =  Get-Random -InputObject $this.cards -Shuffle}


    Sort() { $this.cards.Sort() }
}