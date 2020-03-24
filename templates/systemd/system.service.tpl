[Unit]
Description={{.ServiceName}} service
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
{{- if .MemoryLimit}}
MemoryLimit={{.MemoryLimit}}
{{- end}}
{{- if .CPUQuota}}
CPUQuota={{.CPUQuota}}
{{- end}}
{{- if .IOReadBandwidthMax}}
IOReadBandwidthMax={{.IOReadBandwidthMax}}
{{- end}}
{{- if .IOWriteBandwidthMax}}
IOWriteBandwidthMax={{.IOWriteBandwidthMax}}
{{- end}}
LimitNOFILE=1000000
#LimitCORE=infinity
LimitSTACK=10485760
User={{.User}}
ExecStart=/bin/sh {{.DeployDir}}/scripts/run_{{.ServiceName}}.sh
Restart=on-failure
RestartSec=15s
SendSIGKILL=no

[Install]
WantedBy=multi-user.target