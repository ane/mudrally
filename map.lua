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
          name = "Grass",
          tile = 193,
          properties = {}
        }
      },
      tilecount = 1248,
      tiles = {
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
                x = 4.3353,
                y = 2.06193,
                width = 0,
                height = 0,
                rotation = -50,
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
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Grass",
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
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 393, 194, 194, 194, 194, 290, 194, 289, 194, 258, 194, 257, 194, 194, 194,
        194, 194, 197, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194,
        194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194, 194
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
      objects = {
        {
          id = 6,
          name = "bum bam",
          type = "",
          shape = "polygon",
          x = 279.572,
          y = 20.8083,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -31.5687, y = 52.0405 },
            { x = 0.573976, y = 88.3923 },
            { x = 20.2805, y = 63.52 }
          },
          properties = {
            ["collidable"] = true
          }
        }
      }
    }
  }
}
