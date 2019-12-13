return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 20,
  tileheight = 20,
  nextlayerid = 11,
  nextobjectid = 7,
  properties = {
    ["collidable"] = true
  },
  tilesets = {
    {
      name = "Hard vacuum",
      firstgid = 1,
      filename = "assets/hardvacuum.tsx",
      tilewidth = 20,
      tileheight = 20,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "assets/hard-vacuum.png",
      imagewidth = 640,
      imageheight = 780,
      transparentcolor = "#008a76",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 20,
        height = 20
      },
      properties = {},
      terrains = {
        {
          name = "Sand",
          tile = 535,
          properties = {
            ["friction"] = 0.33000000000000002
          }
        },
        {
          name = "Rock",
          tile = 954,
          properties = {
            ["friction"] = 1
          }
        },
        {
          name = "Grass",
          tile = 193,
          properties = {
            ["friction"] = 0.5
          }
        },
        {
          name = "Ice",
          tile = 705,
          properties = {
            ["friction"] = 0.25
          }
        }
      },
      tilecount = 1248,
      tiles = {
        {
          id = 193,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 196,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = 5.0353,
                y = 5.0353,
                width = 10,
                height = 10,
                rotation = 0,
                visible = true,
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 256,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "a",
                type = "",
                shape = "polygon",
                x = 0.33723,
                y = 14.2761,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 7.64388, y = -2.47302 },
                  { x = 13.4892, y = -7.19424 },
                  { x = 15.5126, y = -14.0513 },
                  { x = 0, y = -14.0513 }
                },
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 257,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "b",
                type = "",
                shape = "polygon",
                x = 7.08183,
                y = -0.11241,
                width = 0,
                height = 0,
                rotation = -1,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 2.02338, y = 6.7446 },
                  { x = 3.14748, y = 8.43076 },
                  { x = 5.95773, y = 10.9038 },
                  { x = 9.89209, y = 14.0513 },
                  { x = 13.0335, y = 14.7237 },
                  { x = 13.152, y = 0.56205 }
                },
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 288,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "c",
                type = "",
                shape = "polygon",
                x = 0,
                y = 14,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 4.94421, y = 6.4655 },
                  { x = 15.0608, y = 6.38944 },
                  { x = 10.4209, y = -1.82555 },
                  { x = 2.05375, y = -8.51925 },
                  { x = -0.380324, y = -8.06286 }
                },
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 289,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "d",
                type = "",
                shape = "polygon",
                x = 5.85698,
                y = 19.8529,
                width = 0,
                height = 0,
                rotation = 0,
                visible = true,
                polygon = {
                  { x = 0, y = 0 },
                  { x = 6.38944, y = -9.81235 },
                  { x = 13.3113, y = -15.5933 },
                  { x = 14.148, y = -5.40059 },
                  { x = 10.1166, y = -0.152129 }
                },
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 392,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "PALLI",
                type = "",
                shape = "ellipse",
                x = 4.11979,
                y = 1.94546,
                width = 10,
                height = 10,
                rotation = 0,
                visible = true,
                properties = {
                  ["collidable"] = true
                }
              }
            }
          }
        },
        {
          id = 535,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 570,
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 705,
          terrain = { 3, 3, 3, 3 }
        },
        {
          id = 738,
          terrain = { 3, -1, -1, -1 }
        },
        {
          id = 954,
          terrain = { 1, 1, 1, 1 }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Ground",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        739, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 536, 536, 536, 536, 536, 536, 536,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706,
        955, 955, 955, 955, 955, 955, 955, 955, 955, 706, 706, 706, 706, 706, 706, 706
      }
    },
    {
      type = "objectgroup",
      id = 10,
      name = "spott",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    }
  }
}
