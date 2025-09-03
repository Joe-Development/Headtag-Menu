# HeadTags System

A FiveM resource that adds customizable head tags above players with ace-based permissions.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)

## Overview

HeadTags System allows server administrators to display customizable tags above players' heads based on their roles and permissions. Perfect for roleplay servers to identify staff members and special roles at a glance.

## Features

- Ace-based headtags using ACE permissions
- Configurable display format and height
- Toggle individual or all headtags
- Search functionality for tags
- Speaking indicator changes color when players talk
- Noclip compatibility

## Dependencies

- [ox_lib](https://github.com/overextended/ox_lib)
- [RageUI](https://github.com/Joe-Development/Headtag-Menu/releases/download/release/RageUI.zip)

## Quick Start

1. Download the latest release
2. Extract to your resources folder
3. Add to your `server.cfg`:
   ```
   ensure ox_lib
   ensure RageUI
   ensure Headtag-Menu
   ```
4. Configure permissions in your server.cfg (see documentation)
5. Use `/headtags` in-game to access the menu

## Documentation

For detailed configuration options, commands, and developer information, please refer to the [documentation](./docs/documentation.md).

## Support

For support or to report issues:
- [Discord Server](https://discord.gg/TZFPF2n5Ys)
- Created by JoeV2@Joe Development