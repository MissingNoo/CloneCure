#macro Lorem "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur neque vitae dolor commodo, vitae pretium massa tincidunt. Cras non mattis elit. Quisque finibus ligula turpis, et placerat erat efficitur eget. Quisque ex justo, scelerisque ac dignissim nec, malesuada vel quam. Etiam ut felis arcu. Nulla facilisi. Etiam euismod viverra lectus, quis gravida eros iaculis id. Nullam gravida, augue id efficitur ullamcorper, nulla ligula commodo metus, in ultrices erat ante a velit. In vehicula mollis justo, et luctus dolor. Nullam nec efficitur nibh. Maecenas sagittis sem vitae mi rutrum, ac mattis eros molestie. Etiam elit magna, pharetra eu accumsan non, cursus in turpis. Pellentesque in fermentum mi, nec fermentum elit."

global.game_uis = {};

global.game_uis.select = {
	"name": "base",
	"top": 50.0,
	"data": {"image": "sTitleBG"},
	"left": 275.0,
	"nodes": [
		{
			"name": "panel_base_60398",
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"nodes": [{"flex": 1.0, "data": {}, "name": "label_title"}],
			"padding": 0.0,
			"marginTop": 20.0,
			"height": 50.0,
		},
		{
			"marginRight": 0.0,
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"margin": 0.0,
			"padding": 0.0,
			"height": 300.0,
			"flex": 1.0,
			"nodes": [
				{
					"flex": 30.0,
					"data": {},
					"nodes": [
						{
							"name": "char_list_1",
							"marginLeft": 182.0,
							"marginRight": 184.0,
							"data": {},
							"padding": 10.0,
							"marginTop": 10.0,
							"height": 133.0,
						},
						{
							"name": "char_list_2",
							"marginLeft": 228.0,
							"marginRight": 229.0,
							"data": {},
							"padding": 10.0,
							"marginTop": 6.0,
							"height": 203.0,
						}
					],
					"margin": 0.0,
					"padding": 10.0,
					"name": "panel_52716",
				}
			],
			"flexDirection": "row",
			"name": "char_list_panel",
		},
		{
			"name": "panel_base",
			"flex": 0.80000001192092896,
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"nodes": [
				{
					"marginLeft": 40.0,
					"marginRight": 37.0,
					"data": {},
					"margin": 0.0,
					"marginBottom": 37.0,
					"padding": 0.0,
					"flex": 1.0,
					"nodes": [
						{
							"flex": 1.0,
							"data": {},
							"nodes": [
								{
									"name": "char_name",
									"padding": 10.0,
									"data": {},
									"height": 43.0,
								},
								{
									"flex": 1.0,
									"data": {},
									"nodes": [
										{
											"name": "oshi_level",
											"marginLeft": 16.0,
											"data": {},
											"marginBottom": 9.0,
											"padding": 10.0,
											"marginTop": 0.0,
											"width": 47.0,
											"height": 54.0,
										},
										{
											"name": "char_sprite",
											"alignSelf": "center",
											"data": {},
											"margin": 5.0,
											"padding": 0.0,
											"width": 110.0,
											"height": 160.0,
										},
										{
											"name": "panel_14422",
											"marginLeft": 35.0,
											"flex": 1.0,
											"marginRight": 15.0,
											"alignSelf": "center",
											"nodes": [
												{
													"name": "stat_hp",
													"flex": 1.0,
													"padding": 7.0,
													"data": {},
													"height": 60.0,
												},
												{
													"name": "stat_atk",
													"flex": 1.0,
													"data": {},
													"padding": 10.0,
													"marginTop": 0.0,
													"height": 60.0,
												},
												{
													"name": "stat_spd",
													"flex": 1.0,
													"padding": 10.0,
													"data": {},
													"height": 60.0,
												},
												{
													"name": "stat_crt",
													"flex": 1.0,
													"data": {},
													"padding": 10.0,
													"marginTop": 0.0,
													"height": 60.0,
												},
												{
													"name": "g_rank",
													"flex": 0.80000001192092896,
													"padding": 10.0,
													"data": {},
													"height": 60.0,
												}
											],
											"data": {},
											"padding": 0.0,
											"height": 180.0,
										}
									],
									"padding": 0.0,
									"flexDirection": "row",
									"name": "panel_33250",
								}
							],
							"padding": 0.0,
							"width": 60.0,
							"name": "panel_61046",
						},
						{
							"flex": 1.0,
							"data": {},
							"nodes": [
								{
									"name": "weapon_name",
									"padding": 10.0,
									"data": {},
									"height": 43.0,
								},
								{
									"name": "weapon_description",
									"flex": 1.0,
									"padding": 10.0,
									"data": {},
									"height": 60.0,
								}
							],
							"padding": 0.0,
							"width": 60.0,
							"name": "panel_48269",
						},
						{
							"flex": 1.0,
							"data": {},
							"nodes": [
								{
									"name": "special_name",
									"padding": 10.0,
									"data": {},
									"height": 43.0,
								},
								{
									"name": "special_description",
									"flex": 1.0,
									"padding": 10.0,
									"data": {},
									"height": 60.0,
								}
							],
							"padding": 0.0,
							"width": 60.0,
							"name": "panel_90069",
						}
					],
					"flexDirection": "row",
					"marginTop": 8.0,
					"name": "panel_info",
				}
			],
			"padding": 0.0,
			"height": 300.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.stage = {
	"width": 1280.0,
	"name": "base",
	"height": 720.0,
	"top": 50.0,
	"data": {"image": "gamea"},
	"nodes": [
		{
			"padding": 0.0,
			"flexDirection": "row",
			"name": "top_panel",
			"height": 300.0,
			"flex": 1.0,
			"top": 0.0,
			"data": {},
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel1",
					"flex": 1.0,
					"data": {},
					"nodes": [
						{
							"marginBottom": 61.0,
							"flexDirection": "row",
							"name": "char_panel",
							"data": {},
							"marginTop": 27.0,
							"padding": 0.0,
							"height": 60.0,
							"flex": 1.0,
							"marginLeft": 8.0,
							"marginRight": 29.0,
							"nodes": [
								{
									"padding": 0.0,
									"width": 60.0,
									"name": "panel_50388",
									"flex": 1.0,
									"data": {},
									"nodes": [
										{
											"padding": 10.0,
											"name": "portrait",
											"minHeight": 79.0,
											"flex": 1,
											"data": {},
										},
										{
											"name": "special",
											"height": 60.0,
											"flex": 1.0,
											"padding": 10.0,
											"data": {},
										}
									],
								},
								{
									"padding": 0.0,
									"width": 60.0,
									"name": "panel_84387",
									"flex": 3.5,
									"data": {},
									"nodes": [
										{
											"name": "hp",
											"height": 17.0,
											"flex": 0.0,
											"padding": 0.0,
											"data": {},
										},
										{
											"marginTop": 13.0,
											"padding": 0.0,
											"name": "got_panel",
											"height": 60.0,
											"flex": 1.0,
											"marginLeft": 7.0,
											"data": {},
											"nodes": [
												{
													"margin": 0.0,
													"padding": 0.0,
													"flexDirection": "row",
													"name": "weapons_panel",
													"height": 60.0,
													"flex": 1,
													"data": {},
													"nodes": [
														{
															"width": 60.0,
															"name": "w0",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "w1",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"margin": 0.0,
															"padding": 0.0,
															"width": 60.0,
															"name": "w2",
															"flex": 1.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "w3",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"padding": 0.0,
															"border": 0.0,
															"width": 60.0,
															"name": "w4",
															"flex": 1.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "w5",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														}
													],
												},
												{
													"padding": 0.0,
													"flexDirection": "row",
													"name": "items_panel",
													"height": 60.0,
													"flex": 1,
													"data": {},
													"nodes": [
														{
															"width": 60.0,
															"name": "i0",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "i1",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "i2",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "i3",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "i4",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														},
														{
															"width": 60.0,
															"name": "i5",
															"flex": 1.0,
															"padding": 0.0,
															"data": {},
														}
													],
												}
											],
										}
									],
								}
							],
						}
					],
				},
				{
					"margin": 0.0,
					"padding": 0.0,
					"flexDirection": "row",
					"width": 60.0,
					"name": "grid_panel2",
					"flex": 1.0,
					"data": {},
					"nodes": [
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_40518",
							"height": 60.0,
							"flex": 1.0,
							"data": {},
						},
						{
							"marginTop": 41.0,
							"padding": 10.0,
							"width": 86.0,
							"name": "stage",
							"height": 42.0,
							"data": {},
						},
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_65507",
							"height": 60.0,
							"flex": 1.0,
							"data": {},
						}
					],
				},
				{
					"padding": 0.0,
					"flexDirection": "row",
					"width": 60.0,
					"name": "grid_panel3",
					"flex": 1.0,
					"data": {},
					"nodes": [
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_5887",
							"height": 60.0,
							"flex": 1.0,
							"data": {},
						},
						{
							"marginTop": 32.0,
							"padding": 0.0,
							"width": 62.0,
							"name": "run_info",
							"height": 62.0,
							"marginLeft": 0.0,
							"marginRight": 233.0,
							"data": {},
							"nodes": [
								{
									"padding": 0.0,
									"flexDirection": "row",
									"name": "panel_50935",
									"height": 60.0,
									"flex": 1.0,
									"data": {},
									"nodes": [
										{
											"width": 32.0,
											"name": "coin",
											"flex": 1.0,
											"padding": 10.0,
											"data": {},
										},
										{
											"width": 60.0,
											"name": "money",
											"flex": 1.0,
											"padding": 10.0,
											"data": {},
										}
									],
								},
								{
									"padding": 0.0,
									"flexDirection": "row",
									"name": "panel_40917",
									"height": 60.0,
									"flex": 1.0,
									"data": {},
									"nodes": [
										{
											"marginTop": 4.0,
											"padding": 10.0,
											"width": 60.0,
											"name": "killspr",
											"flex": 1.0,
											"data": {},
										},
										{
											"marginTop": 4.0,
											"padding": 10.0,
											"width": 60.0,
											"name": "kills",
											"flex": 1.0,
											"data": {},
										}
									],
								}
							],
						}
					],
				}
			],
			"left": 0.0,
		},
		{
			"padding": 0.0,
			"flexDirection": "row",
			"name": "middle_panel",
			"height": 300.0,
			"flex": 1.0,
			"top": 0.0,
			"data": {},
			"nodes": [
				{
					"width": 60.0,
					"name": "grid_panel4",
					"flex": 1.0,
					"padding": 0.0,
					"data": {},
				},
				{
					"margin": 0.0,
					"padding": 0.0,
					"border": 0.0,
					"width": 60.0,
					"name": "grid_panel5",
					"flex": 1.0,
					"data": {},
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel6",
					"flexBasis": 0.0,
					"flex": 1.0,
					"data": {},
				}
			],
			"left": 0.0,
		},
		{
			"padding": 0.0,
			"flexDirection": "row",
			"name": "bottom_panel",
			"height": 300.0,
			"flex": 1.0,
			"top": 0.0,
			"data": {},
			"nodes": [
				{
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel7",
					"flex": 1.0,
					"data": {},
					"nodes": [
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_67171",
							"height": 60.0,
							"flex": 1.0,
							"data": {},
						},
						{
							"margin": 10.0,
							"padding": 10.0,
							"width": 60.0,
							"name": "buffs",
							"height": 60.0,
							"data": {},
						}
					],
				},
				{
					"width": 60.0,
					"name": "grid_panel8",
					"flex": 1.0,
					"padding": 0.0,
					"data": {},
				},
				{
					"width": 60.0,
					"name": "grid_panel9",
					"flex": 1.0,
					"padding": 0.0,
					"data": {},
				}
			],
			"left": 0.0,
		}
	],
	"left": 275.0,
};

global.game_uis.pause = {
	"data": {"image": "pauseda"},
	"nodes": [
		{
			"data": {"image": "sMenu"},
			"gapColumn": 1.0,
			"padding": 0.0,
			"nodes": [
				{
					"maxHeight": 46.0,
					"marginTop": 26.0,
					"marginBottom": 18.0,
					"margin": 0.0,
					"name": "paused",
					"marginLeft": 54.0,
					"data": {"image": "sHudPaused"},
					"maxWidth": 144.0,
					"flex": 0.18000000715255737,
					"padding": 10.0,
					"height": 60.0,
				},
				{
					"data": {},
					"flex": 1.0,
					"padding": 8.0,
					"nodes": [
						{
							"data": {"image": "sHudButton"},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginTop": 6.0,
							"marginBottom": 17.0,
							"width": 60.0,
							"name": "button_character",
							"height": 57.0,
						},
						{
							"data": {},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginBottom": 17.0,
							"width": 60.0,
							"name": "button_stamps",
							"height": 60.0,
						},
						{
							"data": {},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginBottom": 17.0,
							"width": 60.0,
							"name": "button_collabs",
							"height": 60.0,
						},
						{
							"data": {},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginBottom": 17.0,
							"width": 60.0,
							"name": "button_resume",
							"height": 60.0,
						},
						{
							"data": {},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginBottom": 17.0,
							"border": 0.0,
							"width": 60.0,
							"name": "button_settings",
							"height": 60.0,
						},
						{
							"data": {},
							"maxHeight": 43.0,
							"minWidth": 140.0,
							"flex": 1.0,
							"marginBottom": 35.0,
							"margin": 0.0,
							"width": 60.0,
							"name": "button_quit",
							"height": 41.0,
						}
					],
					"alignSelf": "center",
					"name": "panel_49436",
					"height": 60.0,
					"alignItems": "center",
				}
			],
			"alignSelf": "center",
			"width": 257.0,
			"name": "panel_base",
			"height": 490.0,
			"left": 0.0,
			"top": 140.0,
		}
	],
	"width": 1280.0,
	"name": "base",
	"height": 720.0,
	"left": 275.0,
	"top": 50.0,
};

global.game_uis.main_menu = {
	"nodes": [
		{
			"alignItems": "center",
			"padding": 0.0,
			"flex": 1.0,
			"nodes": [
				{
					"padding": 10.0,
					"width": 284.0,
					"name": "version",
					"height": 40.0,
					"positionType": "absolute",
					"top": 11.0,
					"data": {},
					"left": 985.0,
				},
				{
					"padding": 10.0,
					"width": 445.0,
					"name": "title",
					"marginTop": 17.0,
					"height": 199.0,
					"data": {"image": "spr_HoloCureTitle"},
				}
			],
			"name": "chars",
			"height": 300.0,
			"top": 0.0,
			"data": {},
			"left": 0.0,
		},
		{
			"padding": 0.0,
			"alignContent": "",
			"flex": 0.25999999046325684,
			"nodes": [
				{
					"width": 60.0,
					"name": "button_leaderboards",
					"height": 60.0,
					"margin": 0.0,
					"data": {},
					"left": -88.0,
				},
				{
					"marginLeft": 4.0,
					"width": 60.0,
					"marginRight": 0.0,
					"height": 60.0,
					"name": "button_achievements",
					"margin": 0.0,
					"data": {},
					"left": -52.0,
				},
				{
					"marginLeft": 0.0,
					"width": 60.0,
					"marginRight": 0.0,
					"height": 60.0,
					"name": "button_shop",
					"margin": 0.0,
					"data": {},
					"left": -12.0,
				},
				{
					"marginLeft": 0.0,
					"width": 60.0,
					"name": "button_play",
					"height": 60.0,
					"margin": 0.0,
					"data": {},
					"left": 25.0,
				},
				{
					"width": 60.0,
					"marginRight": 0.0,
					"height": 60.0,
					"name": "button_house",
					"margin": 0.0,
					"data": {},
					"left": 68.0,
				},
				{
					"width": 60.0,
					"name": "button_settings",
					"height": 60.0,
					"margin": 0.0,
					"data": {},
					"left": 109.0,
				},
				{
					"width": 60.0,
					"name": "button_credits",
					"height": 60.0,
					"margin": 0.0,
					"data": {},
					"left": 146.0,
				},
				{
					"width": 60.0,
					"name": "button_quit",
					"height": 60.0,
					"margin": 0.0,
					"data": {},
					"left": 185.0,
				}
			],
			"height": 300.0,
			"flexDirection": "row",
			"alignItems": "center",
			"name": "panel_btn",
			"alignSelf": "center",
			"justifyContent": "flex-end",
			"top": 0.0,
			"data": {"image": "sTitleBar"},
			"left": 0.0,
		},
		{
			"padding": 0.0,
			"flex": 0.059999998658895493,
			"name": "bottom",
			"height": 300.0,
			"top": 0.0,
			"data": {"image": ""},
			"left": 0.0,
		}
	],
	"width": 1280.0,
	"name": "base",
	"height": 720.0,
	"justifyContent": "flex-end",
	"top": 50.0,
	"data": {
		"image": "sTitleBG", //"image":"Menu"
	},
	"left": 275.0,
};

global.game_uis.character_stats = {
	"width": 1280.0,
	"name": "base",
	"height": 720.0,
	"nodes": [
		{
			"padding": 0.0,
			"width": 305.0,
			"name": "panel_base",
			"height": 300.0,
			"nodes": [
				{
					"flexDirection": "row",
					"padding": 6.0,
					"name": "back",
					"height": 40.0,
					"nodes": [
						{
							"name": "panel_36812",
							"flex": 0.25,
							"padding": 10.0,
							"data": {},
							"width": 60.0,
						},
						{
							"name": "name",
							"flex": 1.0,
							"padding": 10.0,
							"data": {},
							"width": 60.0,
						}
					],
					"data": {},
				},
				{
					"padding": 5.0,
					"name": "panel_68356",
					"flex": 1.0,
					"height": 60.0,
					"nodes": [
						{
							"name": "HP",
							"flex": 1.0,
							"height": 60.0,
							"padding": 10.0,
							"data": {},
						},
						{
							"name": "ATK",
							"flex": 1.0,
							"height": 60.0,
							"padding": 10.0,
							"data": {},
						},
						{
							"name": "SPD",
							"flex": 1.0,
							"height": 60.0,
							"padding": 10.0,
							"data": {},
						},
						{
							"name": "CRT",
							"flex": 1.0,
							"height": 60.0,
							"padding": 10.0,
							"data": {},
						},
						{
							"name": "Pickup",
							"flex": 1.0,
							"height": 60.0,
							"padding": 10.0,
							"data": {},
						},
						{
							"padding": 10.0,
							"name": "Haste",
							"flex": 1.0,
							"height": 60.0,
							"marginBottom": 0.0,
							"data": {},
						}
					],
					"data": {},
				}
			],
			"top": 270.0,
			"data": {},
			"left": 70.0,
		}
	],
	"top": 50.0,
	"data": {"image": "pauseda"},
	"left": 275.0,
};

global.game_uis.level_up = {
	"name": "base",
	"top": 50.0,
	"data": {"image": "pauseda"},
	"margin": 0.0,
	"left": 275.0,
	"nodes": [
		{
			"name": "panel_base",
			"flex": 1.0,
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"nodes": [
				{
					"marginLeft": 127.0,
					"flex": 0.39500001072883606,
					"data": {},
					"margin": 0.0,
					"nodes": [
						{
							"name": "levelup",
							"marginLeft": -6.0,
							"flex": 0.0,
							"data": {"image": "sLevelUP"},
							"marginTop": 89.0,
							"padding": 0.0,
							"width": 214.0,
							"height": 45.0,
						}
					],
					"marginTop": 108.0,
					"padding": 6.0,
					"width": 60.0,
					"name": "panel_93728",
				},
				{
					"flex": 1.0,
					"data": {},
					"margin": 0.0,
					"nodes": [
						{
							"name": "panel_5849",
							"flex": 1.0,
							"data": {},
							"nodes": [
								{
									"name": "u0",
									"padding": 0.0,
									"data": {"image": ""},
									"minHeight": 125.0,
									"height": 60.0,
								},
								{
									"name": "panel_19613",
									"flex": 1.0,
									"data": {},
									"maxHeight": 9999.0,
									"padding": 0.0,
									"width": 60.0,
									"height": 60.0,
								},
								{
									"name": "u1",
									"padding": 10.0,
									"data": {},
									"height": 126.0,
								},
								{
									"name": "panel_54151",
									"flex": 1.0,
									"data": {},
									"padding": 0.0,
									"width": 60.0,
									"height": 12.0,
								},
								{
									"name": "u2",
									"padding": 10.0,
									"data": {},
									"height": 126.0,
								},
								{
									"name": "panel_18516",
									"flex": 1.0,
									"data": {},
									"padding": 0.0,
									"width": 60.0,
									"height": 12.0,
								},
								{
									"name": "u3",
									"padding": 10.0,
									"data": {},
									"height": 126.0,
								}
							],
							"marginTop": 0.0,
							"padding": 0.0,
							"height": 60.0,
						},
						{
							"name": "panel_36140",
							"data": {},
							"nodes": [
								{
									"maxWidth": 42.0,
									"flex": 0.0,
									"data": {},
									"padding": 10.0,
									"width": 60.0,
									"name": "panel_42975",
								},
								{
									"flex": 1.0,
									"data": {},
									"minWidth": 223.0,
									"padding": 0.0,
									"width": 60.0,
									"name": "Reroll",
								},
								{
									"maxWidth": 17.0,
									"flex": 0.0,
									"data": {},
									"padding": 0.0,
									"width": 60.0,
									"name": "panel_29737",
								},
								{
									"flex": 1.0,
									"data": {},
									"left": 0.0,
									"minWidth": 223.0,
									"padding": 0.0,
									"width": 198.0,
									"name": "Eliminate",
								},
								{
									"maxWidth": 17.0,
									"flex": 0.0,
									"data": {},
									"padding": 0.0,
									"width": 60.0,
									"name": "panel_38445",
								},
								{
									"flex": 1.0,
									"data": {},
									"margin": 0.0,
									"minWidth": 223.0,
									"padding": 0.0,
									"width": 60.0,
									"name": "Hold",
								},
								{
									"maxWidth": 16.0,
									"flex": 0.0,
									"data": {},
									"padding": 0.0,
									"width": 60.0,
									"name": "panel_77150",
								}
							],
							"minWidth": 769.0,
							"padding": 4.0,
							"flexDirection": "row",
							"height": 52.0,
						}
					],
					"marginTop": 108.0,
					"padding": 0.0,
					"border": 0.0,
					"name": "panel_89366",
				},
				{
					"name": "collabs",
					"marginLeft": 48.0,
					"data": {},
					"marginTop": 108.0,
					"padding": 10.0,
					"width": 21.0,
					"height": 520.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"height": 605.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.shop = {
	"nodes": [
		{
			"nodes": [
				{
					"width": 60.0,
					"name": "grid_panel1",
					"padding": 0.0,
					"data": {},
					"flex": 1.0,
				},
				{
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel2",
					"data": {},
					"flex": 1.0,
				},
				{
					"nodes": [
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_44268",
							"height": 60.0,
							"data": {},
							"flex": 1.0,
						},
						{
							"marginTop": 55.0,
							"padding": 10.0,
							"width": 301.0,
							"name": "holocoins",
							"height": 53.0,
							"marginLeft": 0.0,
							"marginRight": 29.0,
							"data": {},
						}
					],
					"padding": 0.0,
					"flexDirection": "row",
					"width": 60.0,
					"name": "grid_panel3",
					"data": {},
					"flex": 1.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"name": "top_panel_grid",
			"height": 300.0,
			"top": 0.0,
			"data": {},
			"flex": 1.0,
			"left": 0.0,
		},
		{
			"nodes": [
				{
					"width": 60.0,
					"name": "grid_panel4",
					"padding": 0.0,
					"data": {},
					"flex": 1.0,
				},
				{
					"margin": 0.0,
					"padding": 0.0,
					"border": 0.0,
					"width": 60.0,
					"name": "grid_panel5",
					"data": {},
					"flex": 1.0,
				},
				{
					"nodes": [
						{
							"nodes": [
								{
									"nodes": [
										{
											"marginBottom": 65.0,
											"marginTop": 5.0,
											"padding": 10.0,
											"name": "tabs",
											"height": 60.0,
											"marginLeft": 10.0,
											"marginRight": 5.0,
											"data": {},
											"flex": 1.0,
										}
									],
									"padding": -10.0,
									"width": 212.0,
									"name": "tabs_panel",
									"height": 357.0,
									"data": {},
								},
								{
									"padding": 10.0,
									"width": 60.0,
									"name": "items_panel",
									"marginLeft": 8.0,
									"data": {},
									"flex": 1.0,
								}
							],
							"padding": 0.0,
							"flexDirection": "row",
							"width": 757.0,
							"name": "shoparea_panel",
							"height": 360.0,
							"top": -129.0,
							"data": {},
							"left": -378.0,
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel6",
					"flexBasis": 0.0,
					"data": {},
					"flex": 1.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"name": "middle_panel_grid",
			"height": 300.0,
			"top": 0.0,
			"data": {},
			"flex": 1.0,
			"left": 0.0,
		},
		{
			"nodes": [
				{
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel7",
					"data": {},
					"flex": 1.0,
				},
				{
					"width": 60.0,
					"name": "grid_panel8",
					"padding": 0.0,
					"data": {},
					"flex": 1.0,
				},
				{
					"nodes": [
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_23136",
							"height": 60.0,
							"data": {},
							"flex": 1.0,
						},
						{
							"nodes": [
								{
									"marginTop": 48.0,
									"padding": 10.0,
									"width": 64.0,
									"name": "item_icon",
									"height": 65.0,
									"marginLeft": 37.0,
									"marginRight": 0.0,
									"data": {},
								},
								{
									"nodes": [
										{
											"marginTop": 8.0,
											"padding": 10.0,
											"width": 139.0,
											"name": "buy",
											"height": 43.0,
											"marginLeft": 80.0,
											"data": {},
											"flex": 0.0,
										},
										{
											"padding": 10.0,
											"width": 60.0,
											"name": "panel_81326",
											"height": 60.0,
											"data": {},
											"flex": 1.0,
										},
										{
											"marginTop": 8.0,
											"padding": 10.0,
											"width": 139.0,
											"name": "refund",
											"height": 43.0,
											"marginLeft": 0.0,
											"marginRight": 178.0,
											"data": {},
											"flex": 0.0,
										}
									],
									"marginBottom": 9.0,
									"marginTop": 43.0,
									"padding": 12.0,
									"flexDirection": "row",
									"name": "item_desc",
									"marginLeft": 44.0,
									"marginRight": 24.0,
									"data": {},
									"flex": 1.0,
								}
							],
							"marginBottom": 0.0,
							"flexDirection": "row",
							"name": "item_desc_panel",
							"data": {},
							"marginTop": 8.0,
							"padding": 0.0,
							"width": 772.0,
							"height": 137.0,
							"marginRight": 0.0,
							"left": -360.0,
						},
						{
							"padding": 10.0,
							"width": 60.0,
							"name": "panel_76103",
							"height": 60.0,
							"data": {},
							"flex": 1.0,
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel9",
					"data": {},
					"flex": 1.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"name": "bottom_panel_grid",
			"height": 300.0,
			"top": 0.0,
			"data": {},
			"flex": 1.0,
			"left": 0.0,
		}
	],
	"width": 1280.0,
	"name": "base",
	"height": 720.0,
	"top": 50.0,
	"data": {"image": "Shop2asd"},
	"left": 275.0,
};

global.game_uis.skin_area = {
	"name": "main_panel",
	"top": 50.0,
	"data": {"image": "selectskin"},
	"left": 275.0,
	"nodes": [
		{
			"name": "panel_4108",
			"minHeight": 280.0,
			"data": {},
			"flex": 2.0,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		},
		{
			"name": "back_panel",
			"minHeight": 402.0,
			"data": {},
			"flex": 0.0,
			"nodes": [
				{
					"name": "panel_96197",
					"data": {},
					"flex": 1.0,
					"padding": 10.0,
					"width": 60.0,
					"height": 60.0,
				},
				{
					"name": "skin_area",
					"height": 60.0,
					"minHeight": 386.0,
					"data": {},
					"padding": 10.0,
					"minWidth": 480.0,
					"marginTop": 11.0,
					"width": 60.0,
				},
				{
					"name": "panel_53729",
					"data": {},
					"flex": 1.0,
					"padding": 10.0,
					"width": 60.0,
					"height": 60.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"height": 60.0,
		},
		{
			"name": "panel_61602",
			"data": {},
			"flex": 0.5,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.stage_mode = {
	"name": "main_panel",
	"top": 120.0,
	"data": {"image": "mode"},
	"left": 320.0,
	"nodes": [
		{
			"name": "panel_4108",
			"minHeight": 280.0,
			"data": {},
			"flex": 2.0,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		},
		{
			"name": "back_panel",
			"minHeight": 402.0,
			"data": {},
			"flex": 0.0,
			"nodes": [
				{
					"name": "panel_92434",
					"data": {},
					"flex": 4.0,
					"padding": 0.0,
					"width": 47.0,
					"height": 60.0,
				},
				{
					"name": "stage",
					"height": 136.0,
					"data": {},
					"padding": 10.0,
					"marginTop": 120.0,
					"width": 387.0,
				},
				{
					"name": "panel_68537",
					"data": {},
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"height": 60.0,
				},
				{
					"name": "endless",
					"height": 136.0,
					"data": {},
					"padding": 10.0,
					"marginTop": 120.0,
					"width": 387.0,
				},
				{
					"name": "panel_64567",
					"data": {},
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"height": 60.0,
				},
				{
					"name": "time",
					"height": 136.0,
					"data": {},
					"padding": 10.0,
					"marginTop": 120.0,
					"width": 387.0,
				},
				{
					"name": "panel_46184",
					"data": {},
					"flex": 4.0,
					"padding": 0.0,
					"width": 60.0,
					"height": 60.0,
				}
			],
			"padding": 0.0,
			"flexDirection": "row",
			"height": 60.0,
		},
		{
			"name": "panel_61602",
			"data": {},
			"flex": 0.5,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.stage_info = {
	"name": "main_panel",
	"top": 110.0,
	"data": {"image": "stagemodes"},
	"left": 320.0,
	"nodes": [
		{
			"name": "panel_4108",
			"minHeight": 280.0,
			"data": {},
			"flex": 2.0,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		},
		{
			"name": "back_panel",
			"minHeight": 402.0,
			"data": {},
			"flex": 0.0,
			"nodes": [
				{
					"height": 73.0,
					"data": {},
					"nodes": [
						{
							"padding": 10.0,
							"data": {},
							"flex": 1.0,
							"width": 60.0,
							"name": "panel_86854",
						},
						{
							"name": "title",
							"height": 44.0,
							"data": {},
							"padding": 10.0,
							"marginTop": 12.0,
							"width": 290.0,
						},
						{
							"padding": 10.0,
							"data": {},
							"flex": 1.0,
							"width": 60.0,
							"name": "panel_50081",
						}
					],
					"padding": 10.0,
					"flexDirection": "row",
					"name": "panel_74949",
				},
				{
					"name": "stage_name",
					"data": {},
					"marginLeft": 221.0,
					"padding": 10.0,
					"width": 480.0,
					"height": 35.0,
				},
				{
					"name": "panel_69267",
					"height": 210.0,
					"data": {},
					"marginLeft": 311.0,
					"nodes": [
						{
							"name": "stage_icon",
							"data": {},
							"flex": 0.0,
							"padding": 10.0,
							"width": 300.0,
							"height": 180.0,
						},
						{
							"data": {},
							"marginLeft": 86.0,
							"flex": 0.0,
							"nodes": [
								{
									"name": "holocoins",
									"padding": 10.0,
									"data": {},
									"height": 30.0,
								},
								{
									"padding": 10.0,
									"data": {},
									"flex": 1.0,
									"marginTop": 30.0,
									"name": "upgrades",
								}
							],
							"padding": 0.0,
							"width": 280.0,
							"name": "panel_73744",
						}
					],
					"padding": 0.0,
					"flexDirection": "row",
					"marginTop": 11.0,
				}
			],
			"padding": 0.0,
			"height": 60.0,
		},
		{
			"name": "panel_61602",
			"data": {},
			"flex": 0.5,
			"padding": 10.0,
			"width": 60.0,
			"height": 60.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.stage = {
	"name": "base",
	"top": 50.0,
	"data": {"image": "gamea"},
	"left": 275.0,
	"nodes": [
		{
			"name": "top_panel",
			"flexDirection": "row",
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"flex": 1.0,
			"nodes": [
				{
					"data": {},
					"flex": 1.0,
					"nodes": [
						{
							"marginBottom": 0.0,
							"data": {},
							"marginTop": 0.0,
							"flex": 1.0,
							"nodes": [
								{
									"name": "hp",
									"padding": 10.0,
									"data": {"image": ""},
									"flex": 0.0,
									"height": 10.0,
								},
								{
									"name": "exp",
									"padding": 10.0,
									"data": {"image": "sExpBar"},
									"height": 10.0,
								}
							],
							"marginLeft": 0.0,
							"padding": 0.0,
							"marginRight": 29.0,
							"name": "char_panel",
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel1",
				},
				{
					"name": "grid_panel2",
					"flexDirection": "row",
					"data": {},
					"flex": 1.0,
					"nodes": [
						{
							"name": "panel_40518",
							"data": {},
							"flex": 1.0,
							"padding": 10.0,
							"width": 60.0,
							"height": 60.0,
						},
						{
							"name": "stage",
							"data": {},
							"marginTop": 50.0,
							"padding": 0.0,
							"width": 86.0,
							"height": 42.0,
						},
						{
							"name": "panel_65507",
							"data": {},
							"flex": 1.0,
							"padding": 10.0,
							"width": 60.0,
							"height": 60.0,
						}
					],
					"padding": 0.0,
					"margin": 0.0,
					"width": 60.0,
				},
				{
					"flexDirection": "row",
					"data": {},
					"flex": 1.0,
					"nodes": [
						{
							"name": "panel_5887",
							"data": {},
							"flex": 1.0,
							"padding": 10.0,
							"width": 60.0,
							"height": 60.0,
						},
						{
							"name": "run_info",
							"data": {},
							"marginTop": 32.0,
							"nodes": [
								{
									"name": "panel_50935",
									"flexDirection": "row",
									"data": {},
									"flex": 1.0,
									"nodes": [
										{
											"name": "coin",
											"padding": 10.0,
											"data": {"image": "sHolocoin"},
											"flex": 1.0,
											"width": 32.0,
										},
										{
											"name": "money",
											"padding": 10.0,
											"data": {},
											"flex": 1.0,
											"width": 60.0,
										}
									],
									"padding": 0.0,
									"height": 60.0,
								},
								{
									"name": "panel_40917",
									"flexDirection": "row",
									"data": {},
									"flex": 1.0,
									"nodes": [
										{
											"data": {"image": "sHuddefeatedEnemies"},
											"marginTop": 4.0,
											"flex": 1.0,
											"padding": 10.0,
											"width": 60.0,
											"name": "killspr",
										},
										{
											"data": {},
											"marginTop": 4.0,
											"flex": 1.0,
											"padding": 10.0,
											"width": 60.0,
											"name": "kills",
										}
									],
									"padding": 0.0,
									"margin": 0.0,
									"height": 60.0,
								}
							],
							"marginLeft": 0.0,
							"padding": 0.0,
							"marginRight": 36.0,
							"width": 62.0,
							"height": 62.0,
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel3",
				}
			],
			"padding": 0.0,
			"height": 300.0,
		},
		{
			"name": "middle_panel",
			"flexDirection": "row",
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"flex": 1.0,
			"nodes": [
				{
					"name": "grid_panel4",
					"padding": 0.0,
					"data": {},
					"flex": 1.0,
					"width": 60.0,
				},
				{
					"border": 0.0,
					"name": "grid_panel5",
					"data": {},
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"margin": 0.0,
				},
				{
					"data": {},
					"flex": 1.0,
					"flexBasis": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel6",
				}
			],
			"padding": 0.0,
			"height": 300.0,
		},
		{
			"name": "bottom_panel",
			"flexDirection": "row",
			"top": 0.0,
			"data": {},
			"left": 0.0,
			"flex": 1.0,
			"nodes": [
				{
					"name": "grid_panel7",
					"data": {},
					"flex": 2.0,
					"nodes": [
						{
							"name": "panel_21727",
							"data": {},
							"flex": 3.0,
							"padding": 10.0,
							"width": 60.0,
							"height": 60.0,
						},
						{
							"name": "buffs",
							"height": 60.0,
							"data": {},
							"padding": 10.0,
							"margin": 10.0,
							"width": 60.0,
						}
					],
					"padding": 0.0,
					"margin": 0.0,
					"width": 60.0,
				},
				{
					"data": {},
					"flex": 1.5,
					"nodes": [
						{
							"name": "panel_977",
							"data": {},
							"flex": 0.75,
							"padding": 10.0,
							"width": 60.0,
							"height": 60.0,
						},
						{
							"height": 60.0,
							"data": {"image": "sItemsHud"},
							"flex": 1.0,
							"nodes": [
								{
									"name": "weapons",
									"flexDirection": "row",
									"data": {},
									"flex": 1.0,
									"nodes": [
										{
											"border": 0.0,
											"name": "w0",
											"data": {},
											"flex": 1.0,
											"marginLeft": 5.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"margin": 0.0,
										},
										{
											"name": "w1",
											"data": {},
											"left": 0.0,
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"border": 0.0,
											"width": 60.0,
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "w2",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "w3",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "w4",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 5.0,
											"width": 60.0,
											"name": "w5",
										}
									],
									"padding": 0.0,
									"margin": 0.0,
									"height": 60.0,
								},
								{
									"name": "items_panel",
									"flexDirection": "row",
									"data": {},
									"flex": 1.0,
									"nodes": [
										{
											"data": {},
											"flex": 1.0,
											"marginLeft": 5.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"name": "i0",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "i1",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "i2",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "i3",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 10.0,
											"width": 60.0,
											"name": "i4",
										},
										{
											"data": {},
											"flex": 1.0,
											"padding": 0.0,
											"marginRight": 5.0,
											"width": 60.0,
											"name": "i5",
										}
									],
									"padding": 0.0,
									"height": 60.0,
								}
							],
							"padding": 10.0,
							"name": "got_items",
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"name": "grid_panel8",
				},
				{
					"name": "grid_panel9",
					"padding": 0.0,
					"data": {},
					"flex": 2.0,
					"width": 60.0,
				}
			],
			"padding": 0.0,
			"height": 300.0,
		}
	],
	"width": 1280.0,
	"height": 720.0,
};

global.game_uis.select = {
  "left":275.0,
  "top":50.0,
  "nodes":[
    {
      "left":0.0,
      "top":0.0,
      "marginTop":20.0,
      "nodes":[
        {
          "flex":1.0,
          "name":"label_title",
          "data":{
          }
        }
      ],
      "padding":0.0,
      "height":50.0,
      "name":"panel_base_60398",
      "data":{
      }
    },
    {
      "left":0.0,
      "top":0.0,
      "padding":0.0,
      "margin":0.0,
      "name":"char_list_panel",
      "data":{
      },
      "flex":1.0,
      "nodes":[
        {
          "flex":30.0,
          "nodes":[
            {
              "flex":0.20000000298023224,
              "width":60.0,
              "padding":0.0,
              "height":10.0,
              "name":"panel_46591",
              "data":{
              }
            },
            {
              "padding":0.0,
              "flex":1.0,
              "name":"panel_22997",
              "data":{
              },
              "nodes":[
                {
                  "marginLeft":0.0,
                  "flex":0.69999998807907104,
                  "marginTop":10.0,
                  "nodes":[
                    {
                      "flex":1.0,
                      "marginBottom":2.0,
                      "padding":0.0,
                      "height":60.0,
                      "margin":0.0,
                      "name":"chars1",
                      "data":{
                      },
                      "flexDirection":"row"
                    },
                    {
                      "flex":1.0,
                      "marginTop":2.0,
                      "padding":0.0,
                      "height":60.0,
                      "name":"chars2",
                      "data":{
                      },
                      "flexDirection":"row"
                    }
                  ],
                  "padding":0.0,
                  "height":133.0,
                  "name":"char_list_1_panel",
                  "data":{
                  },
                  "marginRight":0.0
                },
                {
                  "flex":1.0,
                  "nodes":[
                    {
                      "flex":0.05000000074505806,
                      "width":60.0,
                      "padding":10.0,
                      "height":10.0,
                      "name":"panel_25044",
                      "data":{
                      }
                    },
                    {
                      "marginLeft":0.0,
                      "flex":1.0,
                      "marginTop":6.0,
                      "nodes":[
                        {
                          "flex":1.0,
                          "padding":0.0,
                          "height":60.0,
                          "name":"chars3",
                          "data":{
                          },
                          "flexDirection":"row"
                        },
                        {
                          "flex":1.0,
                          "marginTop":2.0,
                          "padding":0.0,
                          "height":60.0,
                          "name":"chars4",
                          "data":{
                          },
                          "flexDirection":"row"
                        },
                        {
                          "flex":1.0,
                          "marginTop":2.0,
                          "padding":0.0,
                          "height":60.0,
                          "name":"chars5",
                          "data":{
                          },
                          "flexDirection":"row"
                        }
                      ],
                      "padding":0.0,
                      "name":"char_list_2_panel",
                      "data":{
                      },
                      "marginRight":0.0
                    },
                    {
                      "flex":0.05000000074505806,
                      "width":60.0,
                      "padding":10.0,
                      "height":10.0,
                      "name":"panel_42404",
                      "data":{
                      }
                    }
                  ],
                  "padding":0.0,
                  "height":60.0,
                  "name":"panel_12210",
                  "data":{
                  },
                  "flexDirection":"row"
                }
              ]
            },
            {
              "flex":0.20000000298023224,
              "width":60.0,
              "padding":0.0,
              "height":10.0,
              "name":"panel_10647",
              "data":{
              }
            }
          ],
          "padding":10.0,
          "margin":0.0,
          "name":"panel_52716",
          "data":{
          },
          "flexDirection":"row"
        }
      ],
      "height":300.0,
      "flexDirection":"row",
      "marginRight":0.0
    },
    {
      "left":0.0,
      "flex":0.80000001192092896,
      "top":0.0,
      "nodes":[
        {
          "marginLeft":40.0,
          "marginTop":8.0,
          "marginBottom":37.0,
          "padding":0.0,
          "margin":0.0,
          "name":"panel_info",
          "data":{
          },
          "flex":1.0,
          "nodes":[
            {
              "flex":1.0,
              "nodes":[
                {
                  "padding":0.0,
                  "height":3.0,
                  "flex":0.25,
                  "name":"char_name",
                  "data":{
                  }
                },
                {
                  "flex":1.0,
                  "nodes":[
                    {
                      "flex":1.0,
                      "nodes":[
                        {
                          "flex":1.0,
                          "width":60.0,
                          "padding":0.0,
                          "height":60.0,
                          "name":"oshi_level",
                          "data":{
                          }
                        },
                        {
                          "flex":2.0,
                          "width":60.0,
                          "padding":0.0,
                          "height":60.0,
                          "name":"oshi_spacer",
                          "data":{
                          }
                        }
                      ],
                      "width":60.0,
                      "padding":0.0,
                      "name":"oshi_panel",
                      "data":{
                      }
                    },
                    {
                      "padding":0.0,
                      "flex":2.0,
                      "name":"char_sprite",
                      "data":{
                      },
                      "width":60.0
                    },
                    {
                      "flex":3.0,
                      "nodes":[
                        {
                          "padding":0.0,
                          "height":60.0,
                          "flex":1.0,
                          "name":"stat_hp",
                          "data":{
                          }
                        },
                        {
                          "padding":0.0,
                          "height":60.0,
                          "flex":1.0,
                          "name":"stat_atk",
                          "data":{
                          }
                        },
                        {
                          "padding":0.0,
                          "height":60.0,
                          "flex":1.0,
                          "name":"stat_spd",
                          "data":{
                          }
                        },
                        {
                          "padding":0.0,
                          "height":60.0,
                          "flex":1.0,
                          "name":"g_rank",
                          "data":{
                          }
                        }
                      ],
                      "width":60.0,
                      "padding":0.0,
                      "name":"status_panel",
                      "data":{
                      }
                    }
                  ],
                  "padding":10.0,
                  "height":60.0,
                  "name":"character_panel",
                  "data":{
                  },
                  "flexDirection":"row"
                }
              ],
              "width":60.0,
              "padding":0.0,
              "name":"panel_61046",
              "data":{
              }
            },
            {
              "flex":1.0,
              "nodes":[
                {
                  "padding":0.0,
                  "height":43.0,
                  "flex":0.25,
                  "name":"weapon_name",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"weapon_description",
                  "data":{
                  }
                }
              ],
              "width":60.0,
              "padding":0.0,
              "name":"panel_48269",
              "data":{
              }
            },
            {
              "flex":1.0,
              "nodes":[
                {
                  "padding":0.0,
                  "height":43.0,
                  "flex":0.25,
                  "name":"special_name",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"special_description",
                  "data":{
                  }
                }
              ],
              "width":60.0,
              "padding":0.0,
              "name":"panel_90069",
              "data":{
              }
            }
          ],
          "marginRight":37.0,
          "flexDirection":"row"
        }
      ],
      "padding":0.0,
      "height":590.0,
      "name":"panel_base",
      "data":{
      }
    }
  ],
  "width":1280.0,
  "height":720.0,
  "name":"base",
  "data":{
    "image":"sTitleBG"
  }
}

global.game_uis.rooms = {
	"name": "main_panel",
	"nodes": [
		{
			"flex": 1.0,
			"name": "top_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel1",
				},
				{
					"flex": 1.0,
					"name": "grid_panel2",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel3",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "middle_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel4",
				},
				{
					"flex": 1.0,
					"name": "grid_panel5",
					"nodes": [
						{
							"flex": 1.0,
							"name": "join_panel",
							"nodes": [
								{
									"padding": 0.0,
									"width": 60.0,
									"data": {},
									"height": 16.0,
									"name": "join_label",
								},
								{
									"name": "code_panel",
									"nodes": [
										{
											"flex": 1.0,
											"name": "code_label",
											"padding": 10.0,
											"width": 60.0,
											"data": {},
											"height": 25.0,
										},
										{
											"flex": 1.0,
											"name": "spacer",
											"padding": 10.0,
											"width": 60.0,
											"data": {},
											"height": 25.0,
										},
										{
											"marginRight": 4.0,
											"name": "code_input",
											"marginLeft": 0.0,
											"top": 0.0,
											"width": 152.0,
											"data": {},
											"height": 25.0,
										},
										{
											"top": 0.0,
											"width": 160.0,
											"data": {},
											"height": 25.0,
											"name": "join_button",
										},
										{
											"padding": 10.0,
											"width": 32.0,
											"marginLeft": 5.0,
											"data": {},
											"height": 25.0,
											"name": "reload_button",
										}
									],
									"marginTop": 14.0,
									"marginBottom": 0.0,
									"padding": 10.0,
									"data": {"tags": ["fg"]},
									"height": 41.0,
									"flexDirection": "row",
								},
								{
									"flex": 1.0,
									"name": "panel_51891",
									"nodes": [
										{
											"name": "filters",
											"marginTop": 10.0,
											"minWidth": 211.0,
											"padding": 10.0,
											"width": 60.0,
											"data": {"tags": ["fg"]},
										},
										{
											"flex": 1.0,
											"name": "room_panel",
											"nodes": [
												{
													"flex": 1.0,
													"padding": 10.0,
													"marginRight": 12.0,
													"data": {},
													"name": "room_list",
												}
											],
											"marginLeft": 5.0,
											"marginTop": 10.0,
											"padding": 10.0,
											"width": 60.0,
											"data": {"tags": ["fg"]},
										}
									],
									"padding": 0.0,
									"data": {},
									"height": 60.0,
									"flexDirection": "row",
								}
							],
							"marginTop": -98.0,
							"marginBottom": 0.0,
							"maxHeight": 361.0,
							"padding": 10.0,
							"minHeight": 435.0,
							"data": {"tags": ["bg"]},
						}
					],
					"border": 0.0,
					"minWidth": 515.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"flexBasis": 0.0,
					"name": "grid_panel6",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "bottom_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel7",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel8",
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel9",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		}
	],
	"left": 275.0,
	"top": 50.0,
	"width": 1280.0,
	"data": {"image": "sJoin"},
	"height": 720.0,
};

global.game_uis.create = {
	"name": "main_panel",
	"nodes": [
		{
			"flex": 1.0,
			"name": "top_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel1",
				},
				{
					"flex": 1.0,
					"name": "grid_panel2",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel3",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "middle_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel4",
				},
				{
					"flex": 1.0,
					"nodes": [
						{
							"flex": 1.0,
							"name": "create_panel",
							"nodes": [
								{
									"padding": 10.0,
									"width": 90.0,
									"data": {"text": "[c_black][fa_middle]Create game"},
									"height": 30.0,
									"name": "create_label",
								},
								{
									"flex": 1.0,
									"marginRight": 8.0,
									"name": "options_panel",
									"nodes": [
										{
											"flex": 0.0,
											"name": "name_panel",
											"nodes": [
												{
													"padding": 0.0,
													"width": 140.0,
													"data": {
														"text": "[c_black][fa_middle]Join game",
													},
													"name": "display_label",
												},
												{
													"flex": 1.0,
													"padding": 10.0,
													"width": 30.0,
													"data": {},
													"name": "spacer_n",
												},
												{
													"padding": 10.0,
													"maxWidth": 540.0,
													"flex": 4.0,
													"data": {},
													"name": "name_input",
												}
											],
											"marginTop": 0.0,
											"padding": 0.0,
											"data": {},
											"height": 22.0,
											"flexDirection": "row",
										},
										{
											"name": "type_panel",
											"nodes": [
												{
													"padding": 10.0,
													"width": 60.0,
													"data": {
														"text": "[c_black][fa_middle]Type:",
													},
													"name": "type_label",
												},
												{
													"flex": 1.0,
													"padding": 10.0,
													"width": 60.0,
													"data": {},
													"name": "panel_58488",
												},
												{
													"padding": 10.0,
													"width": 180.0,
													"data": {},
													"name": "type_selection",
												}
											],
											"marginTop": 7.0,
											"padding": 0.0,
											"data": {},
											"height": 22.0,
											"flexDirection": "row",
										},
										{
											"name": "maxplayer_panel",
											"nodes": [
												{
													"padding": 10.0,
													"width": 60.0,
													"data": {
														"text": "[c_black][fa_middle]Max Players:",
													},
													"name": "panel_80175",
												},
												{
													"flex": 1.0,
													"padding": 10.0,
													"width": 60.0,
													"name": "panel_86844",
												},
												{
													"padding": 10.0,
													"width": 180.0,
													"data": {},
													"name": "maxp_selection",
												}
											],
											"marginTop": 7.0,
											"padding": 0.0,
											"data": {},
											"height": 22.0,
											"flexDirection": "row",
										},
										{
											"name": "request_panel",
											"nodes": [
												{
													"padding": 10.0,
													"width": 60.0,
													"data": {
														"text": "[c_black][fa_middle]Request to join:",
													},
													"name": "panel_87494",
												},
												{
													"flex": 1.0,
													"padding": 10.0,
													"width": 60.0,
													"data": {},
													"name": "panel_52992",
												},
												{
													"padding": 10.0,
													"width": 180.0,
													"data": {},
													"name": "request_selection",
												}
											],
											"marginTop": 7.0,
											"padding": 0.0,
											"data": {},
											"height": 22.0,
											"flexDirection": "row",
										},
										{
											"flex": 1.0,
											"name": "end_spacer",
											"padding": 0.0,
											"width": 60.0,
											"data": {},
											"height": 0.0,
										},
										{
											"flex": 0.0,
											"name": "end_panel",
											"nodes": [
												{
													"flex": 1.0,
													"name": "spacer",
													"padding": 10.0,
													"width": 60.0,
													"data": {},
													"margin": 9.0,
												},
												{
													"padding": 0.0,
													"width": 60.0,
													"marginRight": 50.0,
													"data": {},
													"name": "create_b_panel",
													"nodes": [
														{
															"flex": 1.0,
															"name": "create_b_spacer",
															"padding": 10.0,
															"width": 60.0,
															"data": {},
															"height": 60.0,
														},
														{
															"flex": 0.0,
															"name": "create_button",
															"padding": 10.0,
															"width": 165.0,
															"data": {},
															"height": 40.0,
														}
													],
												}
											],
											"marginTop": 0.0,
											"padding": 0.0,
											"top": 0.0,
											"data": {},
											"height": 60.0,
											"flexDirection": "row",
											"margin": 0.0,
										}
									],
									"marginLeft": 6.0,
									"marginTop": 8.0,
									"marginBottom": 10.0,
									"padding": 10.0,
									"data": {"tags": ["fg"]},
									"height": 150.0,
								}
							],
							"padding": 10.0,
							"data": {"tags": ["bg"]},
						}
					],
					"border": 0.0,
					"minWidth": 511.0,
					"width": 60.0,
					"data": {},
					"height": 302.0,
					"name": "grid_panel5",
					"padding": 0.0,
					"minHeight": 0.0,
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"flexBasis": 0.0,
					"name": "grid_panel6",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 633.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "bottom_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel7",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel8",
				},
				{
					"flex": 1.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"name": "grid_panel9",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": -27590.0,
			"flexDirection": "row",
		}
	],
	"left": 275.0,
	"top": 50.0,
	"width": 1280.0,
	"data": {"image": "sCreate"},
	"height": 720.0,
};

global.game_uis.login = {
	"name": "main_panel",
	"nodes": [
		{
			"flex": 1.0,
			"name": "top_panel_grid",
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel1",
				},
				{
					"flex": 1.0,
					"name": "grid_panel2",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel3",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "middle_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel4",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"alignItems": "center",
					"flex": 1.0,
					"name": "grid_panel5",
					"border": 0.0,
					"nodes": [
						{
							"name": "login_panel",
							"nodes": [
								{
									"padding": 10.0,
									"data": {"tags": ["fg"]},
									"height": 25.0,
									"name": "title",
									"margin": 5.0,
								},
								{
									"flex": 1.0,
									"name": "body_panel",
									"nodes": [
										{
											"flex": 1.0,
											"name": "user_label",
											"padding": 10.0,
											"width": 60.0,
											"data": {},
											"height": 60.0,
											"alignSelf": "center",
										},
										{
											"padding": 10.0,
											"data": {"tags": ["input"]},
											"height": 60.0,
											"name": "username",
										},
										{
											"flex": 1.0,
											"name": "pass_label",
											"marginTop": 5.0,
											"padding": 10.0,
											"width": 60.0,
											"minHeight": 0.0,
											"data": {},
											"height": 60.0,
											"alignSelf": "center",
										},
										{
											"padding": 10.0,
											"data": {"tags": ["input"]},
											"height": 60.0,
											"name": "password",
										},
										{
											"name": "btn_panel",
											"nodes": [
												{
													"padding": 10.0,
													"width": 60.0,
													"flex": 1.0,
													"data": {},
													"name": "spacer1",
												},
												{
													"padding": 10.0,
													"width": 60.0,
													"flex": 3.0,
													"data": {"tags": ["button"]},
													"name": "login",
												},
												{
													"flex": 1.0,
													"name": "spacer3",
													"padding": 10.0,
													"width": 60.0,
													"data": {},
													"height": 60.0,
												},
												{
													"padding": 10.0,
													"width": 60.0,
													"flex": 3.0,
													"data": {"tags": ["button"]},
													"name": "register",
												},
												{
													"padding": 10.0,
													"width": 60.0,
													"flex": 1.0,
													"data": {},
													"name": "spacer2",
												}
											],
											"left": 0.0,
											"padding": 5.0,
											"data": {},
											"height": 60.0,
											"flexDirection": "row",
										}
									],
									"padding": 10.0,
									"data": {},
									"height": 60.0,
								}
							],
							"padding": 0.0,
							"top": -30.0,
							"width": 450.0,
							"data": {"tags": ["bg"]},
							"height": 300.0,
							"alignSelf": "center",
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"flexBasis": 0.0,
					"flex": 1.0,
					"name": "grid_panel6",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "bottom_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel7",
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"margin": 0.0,
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel8",
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel9",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		}
	],
	"left": 275.0,
	"top": 50.0,
	"width": 1280.0,
	"data": {},
	"height": 720.0,
};

global.game_uis.chat = {
	"name": "main_panel",
	"nodes": [
		{
			"flex": 1.0,
			"name": "top_panel_grid",
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel1",
				},
				{
					"flex": 1.0,
					"name": "grid_panel2",
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel3",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "middle_panel_grid",
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel4",
				},
				{
					"flex": 1.0,
					"name": "grid_panel5",
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"border": 0.0,
				},
				{
					"flex": 1.0,
					"name": "grid_panel6",
					"flexBasis": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "bottom_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel7",
					"margin": 0.0,
					"nodes": [
						{
							"flex": 1.0,
							"name": "chat_panel",
							"margin": 10.0,
							"nodes": [
								{
									"padding": 10.0,
									"data": {"tags": ["fg"]},
									"flex": 1.0,
									"height": 60.0,
									"name": "messages",
								},
								{
									"padding": 10.0,
									"data": {"tags": ["input"]},
									"height": 25.0,
									"name": "text_input",
								}
							],
							"padding": 10.0,
							"data": {"tags": ["bg"]},
							"height": 60.0,
							"border": 0.0,
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel8",
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel9",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		}
	],
	"left": 275.0,
	"top": 50.0,
	"width": 1280.0,
	"data": {},
	"height": 720.0,
};

global.game_uis.friend_list = {
	"name": "main_panel",
	"nodes": [
		{
			"flex": 1.0,
			"name": "top_panel_grid",
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel1",
				},
				{
					"flex": 1.0,
					"name": "grid_panel2",
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel3",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 3.0,
			"name": "middle_panel_grid",
			"nodes": [
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel4",
				},
				{
					"flex": 3.0,
					"name": "grid_panel5",
					"margin": 0.0,
					"nodes": [
						{
							"flex": 1.0,
							"name": "friend_list_panel",
							"nodes": [
								{
									"flex": 0.0,
									"name": "title_panel",
									"nodes": [
										{
											"padding": 10.0,
											"width": 60.0,
											"flex": 1.0,
											"data": {},
											"name": "panel_21366",
										},
										{
											"padding": 10.0,
											"width": 60.0,
											"flex": 1.0,
											"data": {"tags": []},
											"name": "title",
										},
										{
											"padding": 10.0,
											"width": 60.0,
											"flex": 1.0,
											"data": {},
											"name": "panel_82408",
										}
									],
									"padding": 0.0,
									"data": {"tags": ["fg"]},
									"height": 40.0,
									"flexDirection": "row",
								},
								{
									"padding": 10.0,
									"data": {"tags": ["fg"]},
									"flex": 1.0,
									"name": "friend_list",
									"margin": 10.0,
								}
							],
							"padding": 10.0,
							"data": {"tags": ["bg"]},
							"height": 60.0,
						}
					],
					"padding": 0.0,
					"width": 60.0,
					"data": {},
					"border": 0.0,
				},
				{
					"flex": 1.0,
					"name": "grid_panel6",
					"padding": 0.0,
					"width": 60.0,
					"flexBasis": 0.0,
					"data": {},
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		},
		{
			"flex": 1.0,
			"name": "bottom_panel_grid",
			"nodes": [
				{
					"flex": 1.0,
					"name": "grid_panel7",
					"margin": 0.0,
					"padding": 0.0,
					"width": 60.0,
					"data": {},
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel8",
				},
				{
					"padding": 0.0,
					"width": 60.0,
					"flex": 1.0,
					"data": {},
					"name": "grid_panel9",
				}
			],
			"left": 0.0,
			"padding": 0.0,
			"top": 0.0,
			"data": {},
			"height": 300.0,
			"flexDirection": "row",
		}
	],
	"left": 275.0,
	"top": 50.0,
	"width": 1280.0,
	"data": {},
	"height": 720.0,
};

global.game_uis.context_menu = {
	"nodes": [
		{"padding": 10.0, "data": {"tags": ["fg"]}, "height": 15.0, "name": "title"},
		{
			"padding": 10.0,
			"data": {"tags": ["fg"]},
			"height": 60.0,
			"name": "list",
			"marginTop": 5.0,
			"flex": 1.0,
		}
	],
	"name": "main_panel",
	"left": 275.0,
	"padding": 5.0,
	"top": 50.0,
	"width": 200.0,
	"data": {"tags": ["bg"]},
	"height": 300.0,
};

global.game_uis.bloop = {
  "left":275.0,
  "top":50.0,
  "flexDirection":"row",
  "width":1280.0,
  "height":720.0,
  "nodes":[
    {
      "width":60.0,
      "padding":10.0,
      "flex":0.40000000596046448,
      "nodes":[
        {
          "width":60.0,
          "padding":10.0,
          "height":60.0,
          "flex":0.20000000298023224,
          "name":"panel_34552",
          "data":{
          }
        },
        {
          "flexDirection":"row",
          "padding":10.0,
          "height":60.0,
          "flex":1.0,
          "nodes":[
            {
              "width":60.0,
              "padding":10.0,
              "height":60.0,
              "flex":1.2999999523162842,
              "name":"panel_45392",
              "data":{
              }
            },
            {
              "width":60.0,
              "padding":0.0,
              "flex":4.0,
              "nodes":[
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"buy",
                  "data":{
                  }
                },
                {
                  "width":60.0,
                  "padding":0.0,
                  "height":60.0,
                  "flex":0.20000000298023224,
                  "name":"spacer_0",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"sell",
                  "data":{
                  },
                  "margin":0.0
                },
                {
                  "width":60.0,
                  "padding":0.0,
                  "height":60.0,
                  "flex":0.20000000298023224,
                  "name":"spacer_1",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"exchange",
                  "data":{
                  }
                },
                {
                  "width":60.0,
                  "padding":0.0,
                  "height":60.0,
                  "flex":0.20000000298023224,
                  "name":"spacer_1_1",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"talk",
                  "data":{
                  }
                },
                {
                  "width":60.0,
                  "padding":0.0,
                  "height":60.0,
                  "flex":0.20000000298023224,
                  "name":"spacer_1_1_1",
                  "data":{
                  }
                },
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"quit",
                  "data":{
                  }
                }
              ],
              "name":"menu_panel",
              "data":{
              }
            },
            {
              "width":60.0,
              "padding":10.0,
              "height":60.0,
              "flex":0.10000000149011612,
              "name":"panel_2659",
              "data":{
              }
            }
          ],
          "name":"panel_26698",
          "data":{
          }
        },
        {
          "width":60.0,
          "padding":10.0,
          "height":60.0,
          "flex":1.0,
          "name":"panel_51917",
          "data":{
          }
        }
      ],
      "name":"panel_38959",
      "data":{
      }
    },
    {
      "width":60.0,
      "padding":0.0,
      "flex":1.0,
      "nodes":[
        {
          "flexDirection":"row",
          "padding":0.0,
          "height":60.0,
          "flex":0.15000000596046448,
          "nodes":[
            {
              "padding":10.0,
              "flex":0.46000000834465027,
              "name":"panel_3511",
              "data":{
              },
              "width":60.0
            },
            {
              "width":60.0,
              "padding":0.0,
              "flex":1.0,
              "nodes":[
                {
                  "width":60.0,
                  "padding":0.0,
                  "height":60.0,
                  "flex":1.0,
                  "name":"panel_74219",
                  "data":{
                  }
                },
                {
                  "flexDirection":"row",
                  "padding":7.0,
                  "height":60.0,
                  "flex":1.3999999761581421,
                  "nodes":[
                    {
                      "padding":10.0,
                      "flex":1.0,
                      "name":"money",
                      "data":{
                        "image":""
                      },
                      "width":60.0
                    },
                    {
                      "padding":10.0,
                      "flex":0.090000003576278687,
                      "name":"panel_30912_1",
                      "data":{
                      },
                      "width":60.0
                    },
                    {
                      "padding":10.0,
                      "flex":1.0,
                      "name":"dust",
                      "data":{
                      },
                      "width":60.0
                    }
                  ],
                  "name":"panel_32786",
                  "data":{
                  }
                }
              ],
              "name":"panel_64184",
              "data":{
              },
              "margin":0.0
            },
            {
              "padding":10.0,
              "flex":0.029999999329447746,
              "name":"panel_92964",
              "data":{
              },
              "width":60.0
            }
          ],
          "name":"panel_top",
          "data":{
          }
        },
        {
          "flexDirection":"row",
          "padding":0.0,
          "height":60.0,
          "flex":1.0,
          "nodes":[
            {
              "width":60.0,
              "padding":10.0,
              "height":60.0,
              "flex":1.3877787807814457e-16,
              "name":"panel_44910",
              "data":{
              }
            },
            {
              "width":60.0,
              "padding":0.0,
              "flex":44.0,
              "marginTop":0.0,
              "nodes":[
                {
                  "padding":10.0,
                  "height":60.0,
                  "flex":1.0,
                  "marginTop":6.0,
                  "nodes":[
                    {
                      "padding":10.0,
                      "height":60.0,
                      "flex":1.0,
                      "name":"shop_title",
                      "data":{
                      }
                    },
                    {
                      "flexDirection":"row",
                      "padding":0.0,
                      "height":60.0,
                      "flex":10.0,
                      "nodes":[
                        {
                          "width":60.0,
                          "padding":10.0,
                          "height":60.0,
                          "flex":0.10000000149011612,
                          "name":"panel_54151",
                          "data":{
                          }
                        },
                        {
                          "padding":10.0,
                          "flex":3.2000000476837158,
                          "name":"shop_items",
                          "data":{
                          },
                          "width":60.0
                        },
                        {
                          "width":60.0,
                          "padding":10.0,
                          "height":60.0,
                          "flex":0.20000000298023224,
                          "name":"panel_54939",
                          "data":{
                          }
                        }
                      ],
                      "name":"shop_items_panel",
                      "data":{
                      }
                    }
                  ],
                  "name":"shop_panel",
                  "data":{
                  }
                },
                {
                  "width":60.0,
                  "padding":10.0,
                  "height":60.0,
                  "flex":0.079999998211860657,
                  "name":"panel_63987",
                  "data":{
                  }
                }
              ],
              "name":"panel_13919",
              "data":{
              }
            },
            {
              "width":60.0,
              "padding":10.0,
              "height":60.0,
              "flex":1.0,
              "name":"panel_56378",
              "data":{
              }
            }
          ],
          "name":"panel_bottom",
          "data":{
          }
        }
      ],
      "name":"right_panel",
      "data":{
      }
    }
  ],
  "name":"main_panel",
  "data":{
    "image":"houseshop"
  }
}
