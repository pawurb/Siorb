(function() {
  window.Utils = {
    rand: function(min, max) {
      var range;
      if (max == null) {
        max = min;
        min = 0;
      }
      range = max - min;
      return Math.floor((Math.random() * range) + min);
    }
  };

  window.Game = {
    host: "http://www.siorb.dobreziele.pl/assets",
    floatSpeed: 4,
    defaultFloatSpeed: 4,
    score: 0,
    width: 800,
    height: 420,
    window: null,
    scene: null,
    assets: null,
    mute: false,
    start: function() {
      Crafty.init(this.width, this.height);
      if (!localStorage.getItem('highScore')) {
        localStorage.setItem('highScore', 0);
      }
      return this.runScene.mainMenu();
    },
    generatePlatforms: function() {
      var i, level, platformArrangements, randomArrangement, xPos, yPos, _i, _results;
      platformArrangements = [[1, 0, 1, 2, 0, 0, 3, 4, 1, 2], [5, 1, 0, 2, 0, 5, 3, 0, 3, 5], [0, 1, 2, 4, 0, 5, 0, 2, 3, 0], [0, 2, 1, 2, 0, 4, 1, 3, 2, 5, 4]];
      randomArrangement = platformArrangements[Utils.rand(0, platformArrangements.length)];
      _results = [];
      for (i = _i = 0; _i <= 10; i = ++_i) {
        level = randomArrangement[i];
        yPos = 200 + (this.height - this.height / 5 * level - 20);
        xPos = this.width / 5 * i;
        _results.push(Crafty.e('Platform').at(xPos, yPos));
      }
      return _results;
    },
    setupGlobals: function() {
      this.window = document.getElementById('cr-stage');
      this.window.style.backgroundPositionY = '0px';
      Game.runner = Crafty.e('Runner');
      Game.view = Crafty.viewport;
      Crafty.e('BackgroundManager');
      Crafty.e('ScoreBoard');
      Crafty.e('ManaMeter');
      Crafty.e('GameObserver');
      return Crafty.e('RunnerKiller');
    },
    timeouts: {
      slowDown1: null,
      slowDown2: null,
      speedAnimation: null
    },
    runScene: {
      mainMenu: function() {
        var _this = this;
        return Crafty.load(Game.assets.mainMenuList(), function() {
          Game.assets.loadMainMenu();
          return Crafty.scene("MainMenu");
        });
      },
      gameplay: function() {
        var _this = this;
        return Crafty.load(Game.assets.gameplayList(), function() {
          Game.assets.loadGameplay();
          return Crafty.scene("Gameplay");
        });
      },
      gameOver: function() {
        return Crafty.scene('GameOver');
      }
    }
  };

  Crafty.scene('GameOver', function() {
    var offset, replayButton;
    Game.scene = 'GameOver';
    Crafty.background("url('" + Game.host + "/images/gameOverBg.png')");
    Crafty.viewport.y = 0;
    if (Game.score > parseInt(localStorage.getItem('highScore'))) {
      localStorage.setItem('highScore', Game.score);
    }
    offset = 24;
    Crafty.e('Button, punkty_button').at(offset, Game.height - offset * 2);
    Crafty.e('PixelScoreBoard').displayAt(offset + 80, Game.height - offset * 2);
    replayButton = Crafty.e('Button, jeszcze_button');
    replayButton.at(Game.width - offset - 147, Game.height - offset * 2);
    return $(replayButton._element).on('click', function() {
      return setTimeout(function() {
        return Crafty.scene('Gameplay');
      }, 200);
    });
  }, function() {
    Crafty.audio.stop();
    return Crafty("*").destroy();
  });

  Crafty.scene('Gameplay', function() {
    Crafty.audio.stop();
    Game.scene = 'Gameplay';
    Game.score = 0;
    Crafty.audio.stop();
    Crafty.background('');
    Game.setupGlobals();
    return Game.generatePlatforms();
  }, function() {
    return Crafty("*").destroy();
  });

  Crafty.scene('MainMenu', function() {
    var buttonOffset, firstYCoord, soundButton, startButton;
    Game.scene = 'MainMenu';
    Crafty.viewport.y = 0;
    firstYCoord = 200;
    buttonOffset = 60;
    startButton = Crafty.e('Button, start_button').at(545, firstYCoord);
    Crafty.e('Button, instrukcja_button').at(492, firstYCoord + buttonOffset);
    Crafty.e('Button, tworcy_button').at(526, firstYCoord + buttonOffset * 2);
    Crafty.e('Button, rekord_button').at(Game.width - 210, Game.height - 30);
    Crafty.e('Base, leaves_image').at(429, 90);
    Crafty.e('RunnerImage').at(544, 90);
    Crafty.e('RunnerFace').at(544, 90);
    Crafty.background("url('" + Game.host + "/images/mainMenuBg.png')");
    Crafty.e('PixelScoreBoard').displayAt(740, 390);
    soundButton = Crafty.e('Button, sound_button').at(20, 20);
    $(soundButton._element).on('click', function() {
      return Crafty.audio.toggleMute();
    });
    Crafty.e('BlackMask').isVisible().hide();
    Crafty.audio.play('mainMenu', 1, 0.5);
    if (Game.mute) {
      Crafty.audio.mute();
    } else {
      Crafty.audio.unmute();
    }
    return $(startButton._element).on('click', function() {
      return setTimeout(function() {
        return Game.runScene.gameplay();
      }, 200);
    });
  }, function() {
    Crafty.audio.stop();
    return Crafty("*").destroy();
  });

  Game.assets = {
    imagesPath: "" + Game.host + "/images/",
    soundsPath: "" + Game.host + "/sounds/",
    gameplayImagesFiles: ["gameplayBg.jpg", "psychoVisionBg.jpg", "runner.png", "face.png", "guarana.png", "mushroom.png", "leaf.png", "manaMeter.png", "tworcyT.png", "jeszczeRazT.png", "gameOverBg.png"],
    mainMenuImagesFiles: ["mainMenuBg.png", "mainMenuLeaves.png", "instrukcjaT.png", "tworcyT.png", "startT.png", "rekordT.png", "runner.png", "face.png", "digits.png", "sound.png"],
    mainMenuSoundFiles: ["mainMenu.ogg", "mainMenu.mp3"],
    loadGameplay: function() {
      Crafty.sprite(800, 420, "" + this.imagesPath + "psychoVisionBg.jpg", {
        spr_psycho: [0, 0]
      });
      Crafty.sprite(75, 75, "" + this.imagesPath + "runner.png", {
        spr_runner: [0, 0]
      });
      Crafty.sprite(75, 75, "" + this.imagesPath + "face.png", {
        spr_face: [0, 0]
      });
      Crafty.sprite(47, 56, "" + this.imagesPath + "leaf.png", {
        spr_leaf: [0, 0]
      });
      Crafty.sprite(40, 49, "" + this.imagesPath + "mushroom.png", {
        spr_mushroom: [0, 0]
      });
      Crafty.sprite(34, 34, "" + this.imagesPath + "guarana.png", {
        spr_guarana: [0, 0]
      });
      Crafty.sprite(75, 75, "" + this.imagesPath + "manaMeter.png", {
        spr_mana: [0, 0]
      });
      Crafty.sprite(147, 16, "" + this.imagesPath + "jeszczeRazT.png", {
        jeszcze_button: [0, 0]
      });
      return Crafty.sprite(72, 18, "" + this.imagesPath + "punktyT.png", {
        punkty_button: [0, 0]
      });
    },
    loadMainMenu: function() {
      Crafty.sprite(94, 29, "" + this.imagesPath + "startT.png", {
        start_button: [0, 0]
      });
      Crafty.sprite(200, 34, "" + this.imagesPath + "instrukcjaT.png", {
        instrukcja_button: [0, 0]
      });
      Crafty.sprite(134, 34, "" + this.imagesPath + "tworcyT.png", {
        tworcy_button: [0, 0]
      });
      Crafty.sprite(132, 18, "" + this.imagesPath + "rekordT.png", {
        rekord_button: [0, 0]
      });
      Crafty.sprite(76, 64, "" + this.imagesPath + "sound.png", {
        sound_button: [0, 0]
      });
      Crafty.sprite(320, 75, "" + this.imagesPath + "mainMenuLeaves.png", {
        leaves_image: [0, 0]
      });
      Crafty.sprite(75, 75, "" + this.imagesPath + "runner.png", {
        spr_runner: [0, 0]
      });
      Crafty.sprite(75, 75, "" + this.imagesPath + "face.png", {
        spr_face: [0, 0]
      });
      Crafty.sprite(12, 16, "" + this.imagesPath + "digits.png", {
        spr_digits: [0, 0]
      });
      return Crafty.audio.add({
        mainMenu: ["" + this.soundsPath + "/mainMenu.ogg", "" + this.soundsPath + "/mainMenu.mp3"]
      });
    },
    gameplayList: function() {
      var list,
        _this = this;
      list = [];
      _.each(this.gameplayImagesFiles, function(file) {
        return list.push("" + _this.imagesPath + file);
      });
      return list;
    },
    mainMenuList: function() {
      var list,
        _this = this;
      list = [];
      _.each(this.mainMenuImagesFiles, function(file) {
        return list.push("" + _this.imagesPath + file);
      });
      _.each(this.mainMenuSoundFiles, function(file) {
        return list.push("" + _this.soundsPath + file);
      });
      return list;
    }
  };

  Crafty.c('GameObserver', {
    init: function() {
      this.bind('Runner:collectedGuarana', this.speedUpFloating);
      return this.bind('Runner:collectedLeaf', this.scorePoint);
    },
    speedUpFloating: function() {
      var _this = this;
      if (Game.floatSpeed === Game.defaultFloatSpeed) {
        Game.floatSpeed += 3;
      }
      if (Game.timeouts.slowDown1) {
        clearTimeout(Game.timeouts.slowDown1);
      }
      if (Game.timeouts.slowDown2) {
        clearTimeout(Game.timeouts.slowDown2);
      }
      Game.timeouts.slowDown1 = setTimeout(function() {
        return Game.floatSpeed = Game.defaultFloatSpeed + 1;
      }, 3000);
      return Game.timeouts.slowDown2 = setTimeout(function() {
        return Game.floatSpeed = Game.defaultFloatSpeed;
      }, 4000);
    },
    scorePoint: function() {
      Game.score += 1;
      return Crafty.trigger('ScoreBoard:scorePoint');
    }
  });

  Crafty.c('BackgroundManager', {
    backgroundX: 0,
    scrollingSpeed: 1,
    proportion: 4,
    init: function() {
      Game.window.style.backgroundPosition = '0px -1000px';
      this.bind('EnterFrame', function() {
        var backgroundY, position;
        position = Game.window.style.backgroundPosition;
        backgroundY = parseInt(position.split(' ')[1]);
        Game.window.style.backgroundPosition = this.backgroundX.toString() + "px " + backgroundY.toString() + "px";
        if (this.backgroundX === Game.width * 2) {
          return this.backgroundX = 0;
        } else {
          return this.backgroundX -= this.scrollingSpeed;
        }
      });
      return this.bind("Runner:jump", function(data) {
        var arr, backgroundY, treshold;
        Game.view.y -= (data.y + Game.view.y) - Game.height / 2 + 75;
        Game.view.x -= (data.x + Game.view.x) - 50;
        arr = Game.window.style.backgroundPosition.split(' ')[1].split('');
        arr = arr.slice(0, arr.length - 2);
        treshold = data.up ? data.gy - data.jumpSpeed : data.gy;
        backgroundY = (Number(arr.join('')) - treshold / this.proportion).toString();
        return Game.window.style.backgroundPosition = this.backgroundX.toString() + "px " + backgroundY.toString() + "px";
      });
    }
  });

  Crafty.c('Base', {
    init: function() {
      this.requires('2D, DOM, Color');
      return this;
    },
    at: function(x, y) {
      this.attr({
        x: x,
        y: y
      });
      return this;
    }
  });

  Crafty.c('Collectable', {
    init: function() {
      var _this = this;
      this.requires('Base, Collision, Floatable');
      this.attr({
        z: 301
      });
      this.onHit('RunnerImage', function() {
        Crafty.trigger('Collected', {
          name: this.name
        });
        return this.destroy();
      });
      return setTimeout(function() {
        return _this.destroy();
      }, 5000);
    }
  });

  Crafty.c('Floatable', {
    floatLeft: true,
    init: function() {
      return this.bind('EnterFrame', this.float);
    },
    float: function() {
      return this.move('w', Game.floatSpeed);
    }
  });

  Crafty.c('BlackMask', {
    init: function() {
      this.requires('Base');
      this.color('black');
      return this.attr({
        x: Crafty.viewport.x,
        y: Crafty.viewport.y,
        w: Game.width,
        h: Game.height,
        z: 358
      });
    },
    isVisible: function() {
      this.attr({
        alpha: 1
      });
      return this;
    },
    isInvisible: function() {
      $(this._element).hide();
      return this;
    },
    show: function() {
      var _this = this;
      return setTimeout(function() {
        return $(_this._element).fadeIn('slow');
      }, 500);
    },
    hide: function() {
      var _this = this;
      return setTimeout(function() {
        return $(_this._element).fadeOut('slow');
      }, 500);
    }
  });

  Crafty.c('Button', {
    init: function() {
      var _this = this;
      this.requires('Base, Text');
      return $(this._element).hover((function() {
        return _this.attr({
          alpha: 0.5
        });
      }), function() {
        return _this.attr({
          alpha: 1
        });
      });
    }
  });

  Crafty.c('Guarana', {
    name: 'guarana',
    init: function() {
      return this.requires('Collectable, spr_guarana');
    }
  });

  Crafty.c('Leaf', {
    name: 'leaf',
    init: function() {
      return this.requires('Collectable, spr_leaf');
    }
  });

  Crafty.c('ManaMeter', {
    init: function() {
      this.requires('Base, spr_mana');
      this.attr({
        x: Game.width - 100,
        y: Game.view.y + Game.runner.y,
        w: 75,
        h: 75,
        z: 300,
        alpha: 0.6
      });
      this.bind('ScoreBoard:scorePoint', this.updateScoreBoard);
      return this.bind("Runner:jump", function(data) {
        return this.y = Game.runner.y + Game.view.y + data.y - 250;
      });
    },
    updateScoreBoard: function() {
      var manaLevel;
      manaLevel = Game.score < 90 ? parseInt(Game.score / 10) : 9;
      return this.sprite(0, manaLevel);
    }
  });

  Crafty.c('Mushroom', {
    name: 'mushroom',
    init: function() {
      return this.requires('Collectable, spr_mushroom');
    }
  });

  Crafty.c('PixelPoint', {
    init: function() {
      this.requires('Base, spr_digits');
      return this.attr({
        w: 12,
        h: 16,
        z: 301
      });
    },
    print: function(value) {
      this.sprite(0, value);
      return this;
    }
  });

  Crafty.c('PixelScoreBoard', {
    init: function() {
      this.requires('Base');
      this.attr({
        w: 200,
        h: 50,
        z: 301
      });
      return this;
    },
    printScore: function() {
      var score,
        _this = this;
      score = Game.scene === 'GameOver' ? Game.score : Game.scene === 'MainMenu' ? localStorage.getItem('highScore') : 0;
      return _.each(score.toString().split(''), function(point, index) {
        var pixelPoint;
        point = parseInt(point);
        pixelPoint = Crafty.e('PixelPoint').print(point).at(_this.x + (12 * index), _this.y);
        if (Game.scene === 'GameOver') {
          return pixelPoint.attr({
            alpha: 0.5
          });
        }
      });
    },
    displayAt: function(x, y) {
      this.at(x, y);
      return this.printScore();
    }
  });

  Crafty.c('Platform', {
    sizes: [100, 100, 100, 150],
    init: function() {
      this.requires('Base, Solid, Floatable');
      this.attr({
        h: 20,
        w: this.sizes[Utils.rand(0, this.sizes.length)],
        z: 200
      });
      return this.bind('EnterFrame', this.resetPosition);
    },
    resetPosition: function() {
      var higher, lower, random, x, yOffset;
      if (this.x < -200) {
        higher = [-168, -84];
        lower = [84, 168];
        random = [-168, 168];
        yOffset = this.y > 1300 ? higher[Utils.rand(0, 2)] : this.y < 1000 ? lower[Utils.rand(0, 2)] : random[Utils.rand(0, 2)];
        x = Utils.rand(this.width + 200, this.width + 400);
        this.at(Game.width, this.y + yOffset);
        if (Math.random() > 0.65) {
          return this.generateCollectable(this.x + 30, this.y - 50);
        }
      }
    },
    generateCollectable: function(x, y) {
      var random, xOffset;
      random = Math.random();
      xOffset = Utils.rand(20, 30);
      if (random < 0.9) {
        return Crafty.e('Leaf').at(x + xOffset, y);
      } else if (random < 0.97) {
        return Crafty.e('Guarana').at(x + xOffset, y + 20);
      } else {
        return Crafty.e('Mushroom').at(x + xOffset, y + 6);
      }
    }
  });

  Crafty.c('PsychoVision', {
    isAnimating: false,
    duration: 15000,
    init: function() {
      this.requires('Base, spr_psycho');
      this.bind('Runner:psychoVision', this.showVision);
      this.attr({
        x: 0,
        y: 76,
        z: 200
      });
      return $(this._element).hide();
    },
    showVision: function() {
      var _this = this;
      if (!this.isAnimating) {
        $(this._element).stop().fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0.1).fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0.1).fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0.1).fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0.1).fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0.1).fadeTo(this.duration / 12, 0.2).fadeTo(this.duration / 12, 0);
        this.isAnimating = true;
        Crafty.trigger('Face:crazy');
        return setTimeout(function() {
          _this.isAnimating = false;
          return Crafty.trigger('Face:stopCrazy');
        }, this.duration);
      }
    }
  });

  Crafty.c('Runner', {
    speedValue: 0,
    jumpValue: 10,
    backgroundX: 0,
    gravityValue: 0.60,
    scaredFaceVelocity: 40,
    init: function() {
      this.requires('Base, Twoway, Gravity');
      this.attr({
        z: 299
      });
      this.attr({
        x: 50,
        y: Game.height / 2,
        w: 50,
        h: 10,
        z: 300
      });
      this.attach(Crafty.e('RunnerImage'));
      this.attach(Crafty.e('RunnerFace'));
      this.attach(Crafty.e('PsychoVision'));
      this.twoway(this.speedValue, this.jumpValue);
      this.gravity('Solid');
      this.gravityConst(this.gravityValue);
      this.bind("Move", function() {
        if (this._gy !== 0) {
          if (this._gy > this.scaredFaceVelocity) {
            Crafty.trigger('Face:falling');
          }
          if (this._gy > 20) {
            Crafty.trigger('Runner:falling');
          }
          return Crafty.trigger('Runner:jump', {
            gy: this._gy,
            up: this._up,
            jumpSpeed: this._jumpSpeed,
            x: this.x,
            y: this.y
          });
        }
      });
      this.multijumps(2, this.jumpValue / 2, true);
      return this.bind('Collected', this.handleCollected);
    },
    at: function(x, y) {
      return this.attr({
        x: x,
        y: y
      });
    },
    handleCollected: function(data) {
      var _this = this;
      if (data.name === 'guarana') {
        Crafty.trigger('Runner:collectedGuarana');
        this.gravityConst(this.gravityValue - 0.2);
        return setTimeout(function() {
          return _this.gravityConst(_this.gravityValue);
        }, 2000);
      } else if (data.name === 'leaf') {
        return Crafty.trigger('Runner:collectedLeaf');
      } else if (data.name === 'mushroom') {
        return Crafty.trigger('Runner:psychoVision');
      }
    }
  });

  Crafty.c('RunnerFace', {
    mode: 'normal',
    init: function() {
      this.requires('Base, SpriteAnimation, spr_face');
      this.attr({
        z: 299
      });
      this.move('e', 23);
      this.move('s', 148);
      this.bind('Face:faster', this.faceFaster);
      this.bind('Face:normal', this.faceNormal);
      this.bind('Face:crazy', this.faceCrazy);
      this.bind('Face:stopCrazy', this.faceStopCrazy);
      return this.bind('Face:falling', this.faceFalling);
    },
    faceNormal: function() {
      if (this.mode !== 'crazy') {
        return this.sprite(0, 0);
      }
    },
    faceFaster: function() {
      if (this.mode !== 'crazy') {
        return this.sprite(0, 3);
      }
    },
    faceCrazy: function() {
      this.mode = 'crazy';
      return this.sprite(0, 1);
    },
    faceStopCrazy: function() {
      this.mode = 'normal';
      return this.sprite(0, 0);
    },
    faceFalling: function() {
      if (this.mode !== 'crazy') {
        return this.sprite(0, 2);
      }
    }
  });

  Crafty.c('RunnerImage', {
    mode: 'normal',
    init: function() {
      this.requires('Base, SpriteAnimation, spr_runner');
      this.attr({
        z: 299
      });
      this.move('e', 25);
      this.move('s', 148);
      this.reel('Runner:Runs', 300, 0, 0, 3);
      this.reel('Runner:RunsFaster', 150, 0, 0, 3);
      this.animate('Runner:Runs', -1);
      this.bind('hitGround', this.groundHitPose);
      return this.bind('Runner:collectedGuarana', this.runFaster);
    },
    groundHitPose: function() {
      this.resumeAnimation();
      this.bind('Runner:falling', this.fallingPose);
      if (this.mode === 'normal') {
        this.bind("Runner:jump", this.jumpPose);
        Crafty.trigger('Face:normal');
        return this.animate('Runner:Runs', -1);
      }
    },
    fallingPose: function() {
      this.unbind('Runner:falling');
      return this.animate('Runner:RunsFaster', -1);
    },
    jumpPose: function() {
      if (this.mode === 'normal') {
        this.pauseAnimation();
        this.sprite(0, 1);
        return this.unbind("Runner:jump");
      }
    },
    runFaster: function() {
      var _this = this;
      this.animate('Runner:RunsFaster', -1);
      Crafty.trigger('Face:faster');
      this.mode = 'fast';
      if (Game.timeouts.speedAnimation) {
        clearTimeout(Game.timeouts.speedAnimation);
      }
      return Game.timeouts.speedAnimation = setTimeout(function() {
        _this.mode = 'normal';
        Crafty.trigger('Face:normal');
        return _this.animate('Runner:Runs', -1);
      }, 3000);
    }
  });

  Crafty.c('RunnerKiller', {
    deathGrenzenY: 1800,
    init: function() {
      this.requires('Base, Collision');
      this.attr({
        x: 0,
        y: this.deathGrenzenY,
        h: 200,
        w: Game.width
      });
      return this.onHit('RunnerImage', function() {
        Crafty("ScoreBoard").destroy();
        Crafty("ManaMeter").destroy();
        Crafty("PsychoVision").destroy();
        setTimeout(function() {
          return Crafty("BackgroundManager").destroy();
        }, 1000);
        return setTimeout(function() {
          return Crafty.scene('GameOver');
        }, 2500);
      });
    }
  });

  Crafty.c('ScoreBoard', {
    init: function() {
      this.requires('2D, DOM, Text');
      this.attr({
        x: Game.width - 63,
        y: Game.view.y + Game.runner.y,
        w: 400,
        z: 301
      });
      this.textFont({
        type: 'italic',
        size: "20px",
        family: 'Arial'
      });
      this.text("" + Game.score);
      this.bind('ScoreBoard:scorePoint', this.updateScoreBoard);
      return this.bind("Runner:jump", function(data) {
        return this.y = Game.runner.y + Game.view.y + data.y - 215;
      });
    },
    updateScoreBoard: function() {
      return this.text("" + Game.score);
    }
  });

}).call(this);

/*
//@ sourceMappingURL=Siorb.js.map
*/