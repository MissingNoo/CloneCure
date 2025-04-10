global.game_uis = {};

global.game_uis.select = {
	  "width":1280.0,
  "nodes":[
    {
      "padding":0.0,
      "nodes":[
        {
          "name":"label_title",
          "data":{
          },
          "flex":1.0
        }
      ],
      "name":"panel_base_60398",
      "height":50.0,
      "top":0.0,
      "data":{
      },
      "marginTop":20.0,
      "left":0.0
    },
    {
      "padding":0.0,
      "flex":1.0,
      "nodes":[
        {
          "marginLeft":182.0,
          "padding":10.0,
          "marginRight":184.0,
          "name":"char_list_1",
          "height":133.0,
          "data":{
          },
          "marginTop":10.0
        },
        {
          "marginLeft":228.0,
          "padding":10.0,
          "marginRight":229.0,
          "name":"char_list_2",
          "height":203.0,
          "data":{
          },
          "marginTop":6.0
        }
      ],
      "name":"char_list",
      "height":300.0,
      "top":0.0,
      "data":{
      },
      "left":0.0
    },
    {
      "padding":0.0,
      "flex":0.80000001192092896,
      "nodes":[
        {
          "flexDirection":"row",
          "marginBottom":37.0,
          "marginLeft":40.0,
          "marginRight":37.0,
          "name":"panel_info",
          "data":{
          },
          "padding":0.0,
          "flex":1.0,
          "nodes":[
            {
              "padding":0.0,
              "flex":1.0,
              "width":60.0,
              "nodes":[
                {
                  "name":"char_name",
                  "height":43.0,
                  "padding":10.0,
                  "data":{
                  }
                },
                {
                  "flexDirection":"row",
                  "padding":0.0,
                  "flex":1.0,
                  "nodes":[
                    {
                      "marginBottom":9.0,
                      "marginLeft":16.0,
                      "padding":10.0,
                      "alignSelf":"",
                      "width":47.0,
                      "name":"oshi_level",
                      "height":54.0,
                      "data":{
                      },
                      "marginTop":0.0
                    },
                    {
                      "padding":0.0,
                      "alignSelf":"center",
                      "width":110.0,
                      "name":"char_sprite",
                      "height":160.0,
                      "margin":5.0,
                      "data":{
                      }
                    },
                    {
                      "marginLeft":35.0,
                      "padding":0.0,
                      "marginRight":15.0,
                      "flex":1.0,
                      "alignSelf":"center",
                      "nodes":[
                        {
                          "name":"stat_hp",
                          "height":60.0,
                          "padding":7.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "padding":10.0,
                          "flex":1.0,
                          "name":"stat_atk",
                          "height":60.0,
                          "data":{
                          },
                          "marginTop":0.0
                        },
                        {
                          "name":"stat_spd",
                          "height":60.0,
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "padding":10.0,
                          "flex":1.0,
                          "name":"stat_crt",
                          "height":60.0,
                          "data":{
                          },
                          "marginTop":0.0
                        },
                        {
                          "name":"g_rank",
                          "height":60.0,
                          "padding":10.0,
                          "data":{
                          },
                          "flex":0.80000001192092896
                        }
                      ],
                      "height":180.0,
                      "name":"panel_14422",
                      "data":{
                      }
                    }
                  ],
                  "name":"panel_33250",
                  "data":{
                  }
                }
              ],
              "name":"panel_61046",
              "data":{
              }
            },
            {
              "padding":0.0,
              "flex":1.0,
              "width":60.0,
              "nodes":[
                {
                  "name":"weapon_name",
                  "height":43.0,
                  "padding":10.0,
                  "data":{
                  }
                },
                {
                  "name":"weapon_description",
                  "height":60.0,
                  "padding":10.0,
                  "data":{
                  },
                  "flex":1.0
                }
              ],
              "name":"panel_48269",
              "data":{
              }
            },
            {
              "padding":0.0,
              "flex":1.0,
              "width":60.0,
              "nodes":[
                {
                  "name":"special_name",
                  "height":43.0,
                  "padding":10.0,
                  "data":{
                  }
                },
                {
                  "name":"special_description",
                  "height":60.0,
                  "padding":10.0,
                  "data":{
                  },
                  "flex":1.0
                }
              ],
              "name":"panel_90069",
              "data":{
              }
            }
          ],
          "margin":0.0,
          "marginTop":8.0
        }
      ],
      "name":"panel_base",
      "height":300.0,
      "top":0.0,
      "data":{
      },
      "left":0.0
    }
  ],
  "height":720.0,
  "name":"base",
  "top":50.0,
  "data":{
    "image":"sTitleBG"
  },
  "left":275.0
}

global.game_uis.stage = {
  "nodes":[
    {
      "padding":0.0,
      "flex":1.0,
      "nodes":[
        {
          "padding":0.0,
          "positionType":"absolute",
          "nodes":[
            {
              "padding":0.0,
              "flex":1.0,
              "nodes":[
                {
                  "minHeight":31.0,
                  "maxHeight":0.0,
                  "padding":10.0,
                  "maxWidth":33.0,
                  "flex":1.0,
                  "width":60.0,
                  "name":"coin",
                  "data":{
                  }
                },
                {
                  "minHeight":31.0,
                  "maxHeight":31.0,
                  "padding":10.0,
                  "flex":1.0,
                  "width":60.0,
                  "name":"money",
                  "data":{
                  },
                  "margin":0.0
                }
              ],
              "name":"panel_12663",
              "height":60.0,
              "data":{
              },
              "flexDirection":"row"
            },
            {
              "padding":0.0,
              "flex":1.0,
              "nodes":[
                {
                  "marginTop":1.0,
                  "padding":10.0,
                  "maxWidth":33.0,
                  "flex":1.0,
                  "width":60.0,
                  "name":"killspr",
                  "data":{
                  }
                },
                {
                  "marginTop":1.0,
                  "padding":10.0,
                  "flex":1.0,
                  "width":60.0,
                  "name":"kills",
                  "data":{
                  },
                  "margin":0.0
                }
              ],
              "name":"panel_54087",
              "height":58.0,
              "data":{
              },
              "flexDirection":"row",
              "margin":0.0
            }
          ],
          "width":70.0,
          "name":"runinfo",
          "height":65.0,
          "top":32.0,
          "data":{
          },
          "left":1052.0
        },
        {
          "maxHeight":41.0,
          "padding":0.0,
          "flex":1.0,
          "name":"xp",
          "height":71.0,
          "data":{
            "image":"sExpBarBG"
          }
        },
        {
          "minHeight":160.0,
          "maxHeight":0.0,
          "padding":0.0,
          "maxWidth":0.0,
          "flex":1.0,
          "nodes":[
            {
              "padding":10.0,
              "width":90.0,
              "name":"portrait",
              "height":83.0,
              "top":0.0,
              "data":{
                "image":"sUiPortraitFrame"
              }
            },
            {
              "marginTop":89.0,
              "padding":0.0,
              "positionType":"absolute",
              "marginLeft":31.0,
              "width":58.0,
              "name":"special_timer",
              "height":18.0,
              "marginRight":0.0,
              "data":{
              }
            },
            {
              "minHeight":158.0,
              "maxHeight":158.0,
              "padding":0.0,
              "maxWidth":319.0,
              "flex":1.0,
              "nodes":[
                {
                  "name":"hpbar",
                  "height":17.0,
                  "padding":0.0,
                  "data":{
                  }
                },
                {
                  "padding":4.0,
                  "flex":1.0,
                  "nodes":[
                    {
                      "padding":0.0,
                      "flex":1.0,
                      "nodes":[
                        {
                          "name":"w0",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"w1",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "padding":10.0,
                          "flex":1.0,
                          "width":60.0,
                          "name":"w2",
                          "data":{
                          },
                          "flexDirection":"row"
                        },
                        {
                          "name":"w3",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"w4",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"w5",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        }
                      ],
                      "name":"weapons_panel",
                      "height":60.0,
                      "data":{
                      },
                      "flexDirection":"row"
                    },
                    {
                      "padding":0.0,
                      "flex":1.0,
                      "nodes":[
                        {
                          "name":"i0",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"i1",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"i2",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"i3",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"i4",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "name":"i5",
                          "padding":10.0,
                          "flex":1.0,
                          "data":{
                          },
                          "width":60.0
                        }
                      ],
                      "name":"items_panel",
                      "height":60.0,
                      "data":{
                      },
                      "flexDirection":"row"
                    }
                  ],
                  "height":60.0,
                  "margin":4.0,
                  "marginTop":13.0,
                  "marginBottom":8.0,
                  "name":"panel_72420",
                  "border":0.0,
                  "marginRight":0.0,
                  "data":{
                    "image":"sItemsArea"
                  }
                }
              ],
              "width":66.0,
              "height":160.0,
              "marginLeft":7.0,
              "name":"other_panel",
              "data":{
              },
              "minWidth":319.0
            },
            {
              "padding":10.0,
              "flex":1.0,
              "width":60.0,
              "name":"panel_34362",
              "height":60.0,
              "data":{
              }
            },
            {
              "padding":9.0,
              "nodes":[
                {
                  "marginTop":4.0,
                  "padding":0.0,
                  "marginBottom":4.0,
                  "marginLeft":14.0,
                  "width":64.0,
                  "name":"stage",
                  "height":12.0,
                  "data":{
                  }
                },
                {
                  "marginTop":2.0,
                  "padding":10.0,
                  "width":93.0,
                  "name":"time",
                  "height":24.0,
                  "data":{
                  }
                }
              ],
              "width":109.0,
              "name":"stage_panel",
              "height":60.0,
              "data":{
              }
            }
          ],
          "height":160.0,
          "flexDirection":"row",
          "marginTop":-13.0,
          "marginLeft":8.0,
          "name":"info_panel",
          "top":0.0,
          "data":{
          },
          "minWidth":727.0,
          "left":0.0
        },
        {
          "padding":10.0,
          "flex":1.0,
          "width":60.0,
          "name":"panel_8777",
          "height":60.0,
          "data":{
          }
        },
        {
          "name":"buffs",
          "height":60.0,
          "padding":10.0,
          "data":{
          },
          "margin":10.0
        },
        {
          "padding":10.0,
          "flex":0.33000001311302185,
          "width":60.0,
          "name":"panel_87397",
          "height":60.0,
          "data":{
          }
        }
      ],
      "width": "100%",
      "name":"panel_base",
      "height": "100%",
      "top":0.0,
      "data":{
        "image":"gamae"
      },
      "margin":0.0,
      "left":0.0
    }
  ],
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "top":50.0,
  "data":{
  },
  "left":275.0
}

global.game_uis.stage = {
  "padding":0.0,
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "nodes":[
    {
      "margin":0.0,
      "padding":0.0,
      "flex":1.0,
      "width":"100%",
      "name":"panel_base",
      "height":"100%",
      "nodes":[
        {
          "flexDirection":"row",
          "padding":0.0,
          "marginTop":27.0,
          "name":"panel_72182",
          "height":213.0,
          "nodes":[
            {
              "flexDirection":"row",
              "padding":0.0,
              "flex":0.0,
              "width":391.0,
              "name":"player",
              "height":152.0,
              "nodes":[
                {
                  "padding":0.0,
                  "flex":1.0,
                  "width":60.0,
                  "name":"panel_71038",
                  "nodes":[
                    {
                      "marginRight":4.0,
                      "padding":10.0,
                      "flex":1.1000000238418579,
                      "name":"portrait",
                      "height":61.0,
                      "data":{
                      },
                      "marginLeft":0.0
                    },
                    {
                      "padding":10.0,
                      "flex":1.0,
                      "marginBottom":0.0,
                      "name":"special",
                      "height":60.0,
                      "data":{
                      }
                    }
                  ],
                  "data":{
                  }
                },
                {
                  "padding":0.0,
                  "flex":3.1500000953674316,
                  "width":60.0,
                  "name":"panel_56732",
                  "nodes":[
                    {
                      "name":"hp",
                      "height":17.0,
                      "padding":0.0,
                      "data":{
                      }
                    },
                    {
                      "flexDirection":"row",
                      "padding":0.0,
                      "flex":1.0,
                      "marginTop":13.0,
                      "name":"weapons",
                      "height":60.0,
                      "nodes":[
                        {
                          "width":60.0,
                          "name":"w0",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "margin":0.0,
                          "padding":10.0,
                          "flex":1.0,
                          "width":60.0,
                          "name":"w1",
                          "data":{
                          }
                        },
                        {
                          "width":60.0,
                          "name":"w2",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"w3",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"w4",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"w5",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        }
                      ],
                      "data":{
                      }
                    },
                    {
                      "flexDirection":"row",
                      "padding":0.0,
                      "name":"items",
                      "height":60.0,
                      "nodes":[
                        {
                          "width":60.0,
                          "name":"i0",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"i1",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "padding":10.0,
                          "flex":1.0,
                          "border":0.0,
                          "width":60.0,
                          "name":"i2",
                          "data":{
                          }
                        },
                        {
                          "width":60.0,
                          "name":"i3",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"i4",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        },
                        {
                          "width":60.0,
                          "name":"i5",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        }
                      ],
                      "data":{
                      }
                    }
                  ],
                  "data":{
                  }
                }
              ],
              "data":{
              }
            },
            {
              "flexDirection":"row-reverse",
              "padding":0.0,
              "flex":1.0,
              "width":60.0,
              "name":"panel_22114",
              "height":191.0,
              "nodes":[
                {
                  "marginRight":235.0,
                  "padding":0.0,
                  "marginTop":5.0,
                  "width":60.0,
                  "name":"runinfo_panel",
                  "height":62.0,
                  "nodes":[
                    {
                      "flexDirection":"row",
                      "padding":0.0,
                      "flex":1.0,
                      "width":60.0,
                      "name":"panel_42550",
                      "height":60.0,
                      "nodes":[
                        {
                          "aspectRatio":1.0,
                          "padding":0.0,
                          "flex":1.0,
                          "width":31.0,
                          "name":"coin",
                          "height":60.0,
                          "data":{
                          }
                        },
                        {
                          "name":"money",
                          "padding":0.0,
                          "data":{
                          },
                          "flex":1.0
                        }
                      ],
                      "data":{
                      }
                    },
                    {
                      "flexDirection":"row",
                      "margin":0.0,
                      "padding":0.0,
                      "flex":1.0,
                      "width":60.0,
                      "name":"panel_11059",
                      "height":60.0,
                      "nodes":[
                        {
                          "aspectRatio":1.0,
                          "padding":10.0,
                          "width":32.0,
                          "name":"killspr",
                          "height":26.0,
                          "data":{
                          }
                        },
                        {
                          "width":60.0,
                          "name":"kills",
                          "padding":10.0,
                          "data":{
                          },
                          "flex":1.0
                        }
                      ],
                      "data":{
                      }
                    }
                  ],
                  "data":{
                  }
                }
              ],
              "data":{
              }
            }
          ],
          "data":{
          },
          "marginLeft":8.0
        },
        {
          "padding":10.0,
          "flex":1.0,
          "width":60.0,
          "name":"panel_82538",
          "height":60.0,
          "data":{
          }
        },
        {
          "margin":10.0,
          "padding":10.0,
          "width":60.0,
          "name":"buffs",
          "height":60.0,
          "data":{
          }
        }
      ],
      "top":0.0,
      "data":{
        "image":"gamea"
      },
      "left":0.0
    }
  ],
  "top":50.0,
  "data":{
  },
  "left":275.0
}

global.game_uis.pause = {
  "data":{
    "image":"pauseda"
  },
  "nodes":[
    {
      "data":{
        "image":"sMenu"
      },
      "gapColumn":1.0,
      "padding":0.0,
      "nodes":[
        {
          "maxHeight":46.0,
          "marginTop":26.0,
          "marginBottom":18.0,
          "margin":0.0,
          "name":"paused",
          "marginLeft":54.0,
          "data":{
            "image":"sHudPaused"
          },
          "maxWidth":144.0,
          "flex":0.18000000715255737,
          "padding":10.0,
          "height":60.0
        },
        {
          "data":{
          },
          "flex":1.0,
          "padding":8.0,
          "nodes":[
            {
              "data":{
                "image":"sHudButton"
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginTop":6.0,
              "marginBottom":17.0,
              "width":60.0,
              "name":"button_character",
              "height":57.0
            },
            {
              "data":{
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginBottom":17.0,
              "width":60.0,
              "name":"button_stamps",
              "height":60.0
            },
            {
              "data":{
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginBottom":17.0,
              "width":60.0,
              "name":"button_collabs",
              "height":60.0
            },
            {
              "data":{
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginBottom":17.0,
              "width":60.0,
              "name":"button_resume",
              "height":60.0
            },
            {
              "data":{
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginBottom":17.0,
              "border":0.0,
              "width":60.0,
              "name":"button_settings",
              "height":60.0
            },
            {
              "data":{
              },
              "maxHeight":43.0,
              "minWidth":140.0,
              "flex":1.0,
              "marginBottom":35.0,
              "margin":0.0,
              "width":60.0,
              "name":"button_quit",
              "height":41.0
            }
          ],
          "alignSelf":"center",
          "name":"panel_49436",
          "height":60.0,
          "alignItems":"center"
        }
      ],
      "alignSelf":"center",
      "width":257.0,
      "name":"panel_base",
      "height":490.0,
      "left":0.0,
      "top":140.0
    }
  ],
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "left":275.0,
  "top":50.0
}

global.game_uis.main_menu = {
  "nodes":[
    {
      "alignItems":"center",
      "padding":0.0,
      "flex":1.0,
      "nodes":[
        {
          "padding":10.0,
          "width":284.0,
          "name":"version",
          "height":40.0,
          "positionType":"absolute",
          "top":11.0,
          "data":{
          },
          "left":985.0
        },
        {
          "padding":10.0,
          "width":445.0,
          "name":"title",
          "marginTop":17.0,
          "height":199.0,
          "data":{
            "image":"spr_HoloCureTitle"
          }
        }
      ],
      "name":"chars",
      "height":300.0,
      "top":0.0,
      "data":{
      },
      "left":0.0
    },
    {
      "padding":0.0,
      "alignContent":"",
      "flex":0.25999999046325684,
      "nodes":[
        {
          "width":60.0,
          "name":"button_leaderboards",
          "height":60.0,
          "margin":0.0,
          "data":{
          },
          "left":-88.0
        },
        {
          "marginLeft":4.0,
          "width":60.0,
          "marginRight":0.0,
          "height":60.0,
          "name":"button_achievements",
          "margin":0.0,
          "data":{
          },
          "left":-52.0
        },
        {
          "marginLeft":0.0,
          "width":60.0,
          "marginRight":0.0,
          "height":60.0,
          "name":"button_shop",
          "margin":0.0,
          "data":{
          },
          "left":-12.0
        },
        {
          "marginLeft":0.0,
          "width":60.0,
          "name":"button_play",
          "height":60.0,
          "margin":0.0,
          "data":{
          },
          "left":25.0
        },
        {
          "width":60.0,
          "marginRight":0.0,
          "height":60.0,
          "name":"button_house",
          "margin":0.0,
          "data":{
          },
          "left":68.0
        },
        {
          "width":60.0,
          "name":"button_settings",
          "height":60.0,
          "margin":0.0,
          "data":{
          },
          "left":109.0
        },
        {
          "width":60.0,
          "name":"button_credits",
          "height":60.0,
          "margin":0.0,
          "data":{
          },
          "left":146.0
        },
        {
          "width":60.0,
          "name":"button_quit",
          "height":60.0,
          "margin":0.0,
          "data":{
          },
          "left":185.0
        }
      ],
      "height":300.0,
      "flexDirection":"row",
      "alignItems":"center",
      "name":"panel_btn",
      "alignSelf":"center",
      "justifyContent":"flex-end",
      "top":0.0,
      "data":{
        "image":"sTitleBar"
      },
      "left":0.0
    },
    {
      "padding":0.0,
      "flex":0.059999998658895493,
      "name":"bottom",
      "height":300.0,
      "top":0.0,
      "data":{
        "image":""
      },
      "left":0.0
    }
  ],
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "justifyContent":"flex-end",
  "top":50.0,
  "data":{
    "image":"sTitleBG"
    //"image":"Menu"
  },
  "left":275.0
}

global.game_uis.character_stats = {
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "nodes":[
    {
      "padding":0.0,
      "width":305.0,
      "name":"panel_base",
      "height":300.0,
      "nodes":[
        {
          "flexDirection":"row",
          "padding":6.0,
          "name":"back",
          "height":40.0,
          "nodes":[
            {
              "name":"panel_36812",
              "flex":0.25,
              "padding":10.0,
              "data":{
              },
              "width":60.0
            },
            {
              "name":"name",
              "flex":1.0,
              "padding":10.0,
              "data":{
              },
              "width":60.0
            }
          ],
          "data":{
          }
        },
        {
          "padding":5.0,
          "name":"panel_68356",
          "flex":1.0,
          "height":60.0,
          "nodes":[
            {
              "name":"HP",
              "flex":1.0,
              "height":60.0,
              "padding":10.0,
              "data":{
              }
            },
            {
              "name":"ATK",
              "flex":1.0,
              "height":60.0,
              "padding":10.0,
              "data":{
              }
            },
            {
              "name":"SPD",
              "flex":1.0,
              "height":60.0,
              "padding":10.0,
              "data":{
              }
            },
            {
              "name":"CRT",
              "flex":1.0,
              "height":60.0,
              "padding":10.0,
              "data":{
              }
            },
            {
              "name":"Pickup",
              "flex":1.0,
              "height":60.0,
              "padding":10.0,
              "data":{
              }
            },
            {
              "padding":10.0,
              "name":"Haste",
              "flex":1.0,
              "height":60.0,
              "marginBottom":0.0,
              "data":{
              }
            }
          ],
          "data":{
          }
        }
      ],
      "top":270.0,
      "data":{
      },
      "left":70.0
    }
  ],
  "top":50.0,
  "data":{
    "image":"pauseda"
  },
  "left":275.0
}

global.game_uis.level_up = {
  "nodes":[
    {
      "nodes":[
        {
          "flex":0.39500001072883606,
          "nodes":[
            {
              "flex":0.0,
              "marginLeft":-6.0,
              "padding":0.0,
              "width":214.0,
              "name":"levelup",
              "height":45.0,
              "marginTop":89.0,
              "data":{
				"image" : "sLevelUP"
              }
            }
          ],
          "padding":6.0,
          "margin":0.0,
          "width":60.0,
          "name":"panel_93728",
          "data":{
          }
        },
        {
          "flex":1.0,
          "border":0.0,
          "nodes":[
            {
              "flex":1.0,
              "nodes":[
                {
                  "name":"u0",
                  "height":60.0,
                  "padding":0.0,
                  "data":{
                    "image":""
                  },
                  "minHeight":125.0
                },
                {
                  "padding":0.0,
                  "width":60.0,
                  "name":"panel_19613",
                  "maxHeight":12.0,
                  "height":60.0,
                  "data":{
                  }
                },
                {
                  "name":"u1",
                  "height":126.0,
                  "padding":10.0,
                  "data":{
                  }
                },
                {
                  "name":"panel_54151",
                  "height":12.0,
                  "padding":0.0,
                  "data":{
                  },
                  "width":60.0
                },
                {
                  "name":"u2",
                  "height":126.0,
                  "padding":10.0,
                  "data":{
                  }
                },
                {
                  "name":"panel_18516",
                  "height":12.0,
                  "padding":0.0,
                  "data":{
                  },
                  "width":60.0
                },
                {
                  "name":"u3",
                  "height":126.0,
                  "padding":10.0,
                  "data":{
                  }
                }
              ],
              "padding":0.0,
              "name":"panel_5849",
              "height":60.0,
              "data":{
              }
            },
            {
              "nodes":[
                {
                  "flex":0.0,
                  "padding":10.0,
                  "width":60.0,
                  "name":"panel_42975",
                  "data":{
                  },
                  "maxWidth":42.0
                },
                {
                  "flex":0.0,
                  "padding":0.0,
                  "width":60.0,
                  "name":"Reroll",
                  "minWidth":223.0,
                  "data":{
                  }
                },
                {
                  "flex":0.0,
                  "padding":0.0,
                  "width":60.0,
                  "name":"panel_29737",
                  "data":{
                  },
                  "maxWidth":17.0
                },
                {
                  "flex":0.0,
                  "padding":0.0,
                  "width":198.0,
                  "name":"Eliminate",
                  "minWidth":223.0,
                  "data":{
                  },
                  "left":0.0
                },
                {
                  "flex":0.0,
                  "padding":0.0,
                  "width":60.0,
                  "name":"panel_38445",
                  "data":{
                  },
                  "maxWidth":17.0
                },
                {
                  "flex":1.0,
                  "padding":0.0,
                  "margin":0.0,
                  "width":60.0,
                  "name":"Hold",
                  "minWidth":223.0,
                  "data":{
                  }
                },
                {
                  "flex":0.0,
                  "padding":0.0,
                  "width":60.0,
                  "name":"panel_77150",
                  "data":{
                  },
                  "maxWidth":16.0
                }
              ],
              "padding":4.0,
              "name":"panel_36140",
              "height":52.0,
              "minWidth":769.0,
              "flexDirection":"row",
              "data":{
              }
            }
          ],
          "padding":0.0,
          "margin":0.0,
          "name":"panel_89366",
          "data":{
          }
        },
        {
          "marginLeft":48.0,
          "padding":10.0,
          "width":21.0,
          "name":"collabs",
          "height":520.0,
          "marginTop":11.0,
          "data":{
          }
        }
      ],
      "padding":0.0,
      "width":1153.0,
      "name":"panel_base",
      "height":605.0,
      "flexDirection":"row",
      "top":108.0,
      "data":{
      },
      "left":127.0
    }
  ],
  "margin":0.0,
  "width":1280.0,
  "name":"base",
  "height":720.0,
  "top":50.0,
  "data":{
    "image":"pauseda"
  },
  "left":275.0
}