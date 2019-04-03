function Get-GrafanaApiKey {
    <#
        .SYNOPSIS
        Retrieve a list of API keys created in Grafana

        .EXAMPLE 
        Get-GrafanaApiKey
    #>
    [cmdletBinding(HelpUri="ttps://github.com/steviecoaster/PSGrafana/wiki/Get-GrafanaApiKey")]
    Param()
    
    begin { $null = Get-GrafanaConfig }

    process {
        
        $header = @{ Authorization = "Bearer $($Configuration.apikey)"}

        $irmParams = @{
            Method = 'GET'
            Uri = "$($Configuration.GrafanaUri)/auth/keys"
            Headers = $header
            ContentType = "application/json"

        }

        Invoke-RestMethod @irmParams
    }
}