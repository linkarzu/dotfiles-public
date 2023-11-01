import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_command", "left_control", "left_option"],
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },

  // I couldn't get this work with the magic mouse because it only detects button1 in the karabiner event viewer
  // You need to enable pro mode in karabiner for the work with the apple mouse
  // It works with the logitech mouse tough
  // {
  //   description: "Simultaneous Left and Right Click to Cmd+Shift+S",
  //   manipulators: [
  //     {
  //       type: "basic",
  //       parameters: {
  //         "basic.simultaneous_threshold_milliseconds": 500
  //       },
  //       from: {
  //         simultaneous: [
  //           { "pointing_button": "button1" },
  //           { "pointing_button": "button2" }
  //         ],
  //         simultaneous_options: {
  //           detect_key_down_uninterruptedly: true,
  //           key_down_order: "strict",
  //           key_up_order: "strict",
  //           key_up_when: "all"
  //         }
  //       },
  //       to: [
  //         {
  //           key_code: "s",
  //           modifiers: ["left_command", "left_shift"]
  //         },
  //       ],
  //     },
  //   ],
  // },

  ...createHyperSubLayers({
    // I use spacebar as the app launcher
    spacebar: {
      j: app("Alacritty"),
      k: app("Google Chrome"),
      l: app("Obsidian"),
      semicolon: app("ChatGPT"),
      quote: app("System Settings"),
      i: app("Slack"),
      u: app("WhatsApp Web"),
      p: app("Brave Browser"),
      o: app("Preview"),
      open_bracket: app("Reminders"),
      m: app("Mail"),
      comma: app("Microsoft Outlook"),
      period: app("Finder"),
      slash: app("GoTo"),
      h: app("Spotify"),
      y: app("YouTube"),
      n: app("Visual Studio Code"),
      d: app("Dashlane"),
      z: app("zoom.us"),
      w: app("Microsoft Word"),
      e: app("Microsoft Excel"),
      q: app("Setapp"),
      s: app("Safari"),
      r: app("MySQLWorkbench"),
    },

    // r = "Raycast"
    r: {
      j: open(
        "raycast://extensions/lardissone/raindrop-io/search"
      ),
      k: open(
        "raycast://extensions/mblode/google-search/index"
      ),
      l: open(
        "raycast://extensions/KevinBatdorf/obsidian/searchNoteCommand"
      ),
      semicolon: open(
        ""
      ),
      quote: open(
        "raycast://extensions/mathieudutour/wolfram-alpha/index"
      ),
      u: open(
        "raycast://extensions/raycast/reminders/create-reminder"
      ),
      i: open(
        "raycast://extensions/raycast/reminders/my-reminders"
      ),
      o: open(
        "raycast://extensions/raycast/github/search-repositories"
      ),
      p: open(
        "raycast://extensions/nhojb/brew/search"
      ),
      h: open(
        "raycast://extensions/mattisssa/spotify-player/search"
      ),
    },

    // s = "System"
    s: {
      k: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      // Move between tabs in browsers
      l: {
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["left_command", "left_shift"],
          },
        ],
      },
      // Move between tabs in browsers
      h: {
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["left_command", "left_shift"],
          },
        ],
      },
      o: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      y: {
        to: [
          {
            key_code: "rewind",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      u: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      // Lock screen 
      d: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      // Close browser tab
      e: {
        to: [
          {
            key_code: "w",
            modifiers: ["left_command"],
          },
        ],
      },
      m: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "AirPods Pro"; /opt/homebrew/bin/SwitchAudioSource -t input -s "AirPods Pro"`,
          },
        ],
      },
      comma: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "LG TV"; /opt/homebrew/bin/SwitchAudioSource -t input -s "C922 Pro Stream Webcam"`,
          },
        ],
      },
      period: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "Mac mini Speakers"; /opt/homebrew/bin/SwitchAudioSource -t input -s "C922 Pro Stream Webcam"`,
          },
        ],
      },
      slash: {
        to: [
          {
            shell_command: `/opt/homebrew/bin/SwitchAudioSource -s "MacBook Pro Speakers"; /opt/homebrew/bin/SwitchAudioSource -t input -s "MacBook Pro Microphone"`,
          },
        ],
      },
      n: open(
        "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"
      ),
    },

    // shift+arrows to select stuff
    f: {
      h: {
        to: [{ key_code: "left_arrow", modifiers: ["left_shift"] }],
      },
      j: {
        to: [{ key_code: "down_arrow", modifiers: ["left_shift"] }],
      },
      k: {
        to: [{ key_code: "up_arrow", modifiers: ["left_shift"] }],
      },
      l: {
        to: [{ key_code: "right_arrow", modifiers: ["left_shift"] }],
      },
      y: {
        to: [{ key_code: "left_arrow", modifiers: ["left_shift", "left_option"] }],
      },
      u: {
        to: [{ key_code: "down_arrow", modifiers: ["left_shift", "left_option"] }],
      },
      i: {
        to: [{ key_code: "up_arrow", modifiers: ["left_shift", "left_option"] }],
      },
      o: {
        to: [{ key_code: "right_arrow", modifiers: ["left_shift", "left_option"] }],
      },
      // Magicmove via homerow.app
      m: {
        to: [{ key_code: "f", modifiers: ["right_control"] }],
      },
      // Scroll mode via homerow.app
      s: {
        to: [{ key_code: "j", modifiers: ["right_control"] }],
      },
    },

    // copy, paste and other stuff 
    right_command: {
      r: {
        to: [{ key_code: "r", modifiers: ["left_control"] }],
      },
      // Slack go to all unreads
      a: {
        to: [{ key_code: "a", modifiers: ["left_command", "left_shift"] }],
      },
      h: {
        to: [{ key_code: "delete_or_backspace" }],
      },
      l: {
        to: [{ key_code: "delete_forward" }],
      },
      // Switch between windows of same app
      spacebar: {
        to: [{ key_code: "grave_accent_and_tilde", modifiers: ["left_command"] }],
      },
    },

    // 'e' for extra tools
    e: {
      // To edit the contents of an excel cell
      u: {
        to: [{ key_code: "f2" }],
      },
      // Focus outline in obsidian
      o: {
        to: [{ key_code: "x", modifiers: ["left_command", "left_shift"] }],
      },
      // Increase LG TV volume
      k: {
        to: [
          {
            shell_command: `~/opt/lgtv/bin/python3 ~/opt/lgtv/bin/lgtv MyTV volumeUp ssl`,
          },
        ],
      },
      // Decrease LG TV volume
      j: {
        to: [
          {
            shell_command: `~/opt/lgtv/bin/python3 ~/opt/lgtv/bin/lgtv MyTV volumeDown ssl`,
          },
        ],
      },
    },


    // Vim nagivation
    // ALWAYS LEAVE THE ONES WITHOUT ANY SUBLAYERS AT THE BOTTOM
    h: {
      to: [{ key_code: "left_arrow" }],
    },
    j: {
      to: [{ key_code: "down_arrow" }],
    },
    k: {
      to: [{ key_code: "up_arrow" }],
    },
    l: {
      to: [{ key_code: "right_arrow" }],
    },

  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
