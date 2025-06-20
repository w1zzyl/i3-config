#!/bin/sh

function main() {
    DEFAULT_SINK=$(pw-dump | jq -r '.[] | select(.type=="PipeWire:Interface:Node") | select(.info.props."media.class"=="Audio/Sink") | .info.props."node.description"' | head -n1)
    DEFAULT_SOURCE=$(pw-dump | jq -r '.[] | select(.type=="PipeWire:Interface:Node") | select(.info.props."media.class"=="Audio/Source") | .info.props."node.description"' | head -n1)
    VOLUME=$(pamixer --get-volume-human)

    case $1 in
        "up")
            pamixer --increase 10
            ;;
        "down")
            pamixer --decrease 10
            ;;
        "mute")
            pamixer --toggle-mute
            ;;
        *)
            echo "Source: ${DEFAULT_SOURCE} | Sink: ${VOLUME}"
    esac
}

main "$@"

