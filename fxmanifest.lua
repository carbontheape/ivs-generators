fx_version('cerulean')
games({ 'gta5' })

author 'Carbon#1000'
description 'ivs-generators'
version '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_*.lua',
}

server_scripts {
    'server/sv_*.lua'
}

shared_scripts {
    'config.lua'
}

lua54 'yes'