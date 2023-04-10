///
//  Generated code. Do not modify.
//  source: proto/state.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pb.dart' as $0;

import 'state.pbenum.dart';

export 'state.pbenum.dart';

enum GameState_Stage { lobby, preparing, round, finished, notSet }

class GameState extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameState_Stage> _GameState_StageByTag = {
    5: GameState_Stage.lobby,
    6: GameState_Stage.preparing,
    7: GameState_Stage.round,
    8: GameState_Stage.finished,
    0: GameState_Stage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameState',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 8])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rev',
        $pb.PbFieldType.OU3)
    ..m<$core.int, Player>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players',
        entryClassName: 'GameState.PlayersEntry',
        keyFieldType: $pb.PbFieldType.OF3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Player.create,
        packageName: const $pb.PackageName('hat_game.state'))
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hostId',
        $pb.PbFieldType.OF3)
    ..aOM<Settings>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settings',
        subBuilder: Settings.create)
    ..aOM<Lobby>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lobby',
        subBuilder: Lobby.create)
    ..aOM<RunningGameState>(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preparing',
        subBuilder: RunningGameState.create)
    ..aOM<Round>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round',
        subBuilder: Round.create)
    ..aOM<RunningGameState>(
        8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'finished',
        subBuilder: RunningGameState.create)
    ..hasRequiredFields = false;

  GameState._() : super();
  factory GameState({
    $core.int? rev,
    $core.Map<$core.int, Player>? players,
    $core.int? hostId,
    Settings? settings,
    Lobby? lobby,
    RunningGameState? preparing,
    Round? round,
    RunningGameState? finished,
  }) {
    final _result = create();
    if (rev != null) {
      _result.rev = rev;
    }
    if (players != null) {
      _result.players.addAll(players);
    }
    if (hostId != null) {
      _result.hostId = hostId;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    if (lobby != null) {
      _result.lobby = lobby;
    }
    if (preparing != null) {
      _result.preparing = preparing;
    }
    if (round != null) {
      _result.round = round;
    }
    if (finished != null) {
      _result.finished = finished;
    }
    return _result;
  }
  factory GameState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameState clone() => GameState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameState copyWith(void Function(GameState) updates) =>
      super.copyWith((message) => updates(message as GameState))
          as GameState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameState create() => GameState._();
  GameState createEmptyInstance() => create();
  static $pb.PbList<GameState> createRepeated() => $pb.PbList<GameState>();
  @$core.pragma('dart2js:noInline')
  static GameState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameState>(create);
  static GameState? _defaultInstance;

  GameState_Stage whichStage() => _GameState_StageByTag[$_whichOneof(0)]!;
  void clearStage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get rev => $_getIZ(0);
  @$pb.TagNumber(1)
  set rev($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRev() => $_has(0);
  @$pb.TagNumber(1)
  void clearRev() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.int, Player> get players => $_getMap(1);

  @$pb.TagNumber(3)
  $core.int get hostId => $_getIZ(2);
  @$pb.TagNumber(3)
  set hostId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHostId() => clearField(3);

  @$pb.TagNumber(4)
  Settings get settings => $_getN(3);
  @$pb.TagNumber(4)
  set settings(Settings v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSettings() => $_has(3);
  @$pb.TagNumber(4)
  void clearSettings() => clearField(4);
  @$pb.TagNumber(4)
  Settings ensureSettings() => $_ensure(3);

  @$pb.TagNumber(5)
  Lobby get lobby => $_getN(4);
  @$pb.TagNumber(5)
  set lobby(Lobby v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLobby() => $_has(4);
  @$pb.TagNumber(5)
  void clearLobby() => clearField(5);
  @$pb.TagNumber(5)
  Lobby ensureLobby() => $_ensure(4);

  @$pb.TagNumber(6)
  RunningGameState get preparing => $_getN(5);
  @$pb.TagNumber(6)
  set preparing(RunningGameState v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPreparing() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreparing() => clearField(6);
  @$pb.TagNumber(6)
  RunningGameState ensurePreparing() => $_ensure(5);

  @$pb.TagNumber(7)
  Round get round => $_getN(6);
  @$pb.TagNumber(7)
  set round(Round v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRound() => $_has(6);
  @$pb.TagNumber(7)
  void clearRound() => clearField(7);
  @$pb.TagNumber(7)
  Round ensureRound() => $_ensure(6);

  @$pb.TagNumber(8)
  RunningGameState get finished => $_getN(7);
  @$pb.TagNumber(8)
  set finished(RunningGameState v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFinished() => $_has(7);
  @$pb.TagNumber(8)
  void clearFinished() => clearField(8);
  @$pb.TagNumber(8)
  RunningGameState ensureFinished() => $_ensure(7);
}

class Player extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Player',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..e<PlayerStatus>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: PlayerStatus.JOINING,
        valueOf: PlayerStatus.valueOf,
        enumValues: PlayerStatus.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false;

  Player._() : super();
  factory Player({
    PlayerStatus? status,
    $core.String? name,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Player.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Player.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Player clone() => Player()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Player copyWith(void Function(Player) updates) =>
      super.copyWith((message) => updates(message as Player))
          as Player; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Player create() => Player._();
  Player createEmptyInstance() => create();
  static $pb.PbList<Player> createRepeated() => $pb.PbList<Player>();
  @$core.pragma('dart2js:noInline')
  static Player getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Player>(create);
  static Player? _defaultInstance;

  @$pb.TagNumber(1)
  PlayerStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(PlayerStatus v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Settings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Settings',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characterCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnDurationS',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voteTimeoutS',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTimeoutS',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirmTimeoutS',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Settings._() : super();
  factory Settings({
    $core.int? characterCount,
    $core.int? turnDurationS,
    $core.int? voteTimeoutS,
    $core.int? startTimeoutS,
    $core.int? confirmTimeoutS,
  }) {
    final _result = create();
    if (characterCount != null) {
      _result.characterCount = characterCount;
    }
    if (turnDurationS != null) {
      _result.turnDurationS = turnDurationS;
    }
    if (voteTimeoutS != null) {
      _result.voteTimeoutS = voteTimeoutS;
    }
    if (startTimeoutS != null) {
      _result.startTimeoutS = startTimeoutS;
    }
    if (confirmTimeoutS != null) {
      _result.confirmTimeoutS = confirmTimeoutS;
    }
    return _result;
  }
  factory Settings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Settings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Settings clone() => Settings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Settings copyWith(void Function(Settings) updates) =>
      super.copyWith((message) => updates(message as Settings))
          as Settings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Settings create() => Settings._();
  Settings createEmptyInstance() => create();
  static $pb.PbList<Settings> createRepeated() => $pb.PbList<Settings>();
  @$core.pragma('dart2js:noInline')
  static Settings getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Settings>(create);
  static Settings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get characterCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set characterCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCharacterCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get turnDurationS => $_getIZ(1);
  @$pb.TagNumber(2)
  set turnDurationS($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTurnDurationS() => $_has(1);
  @$pb.TagNumber(2)
  void clearTurnDurationS() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get voteTimeoutS => $_getIZ(2);
  @$pb.TagNumber(3)
  set voteTimeoutS($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVoteTimeoutS() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoteTimeoutS() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get startTimeoutS => $_getIZ(3);
  @$pb.TagNumber(4)
  set startTimeoutS($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStartTimeoutS() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTimeoutS() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get confirmTimeoutS => $_getIZ(4);
  @$pb.TagNumber(5)
  set confirmTimeoutS($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasConfirmTimeoutS() => $_has(4);
  @$pb.TagNumber(5)
  void clearConfirmTimeoutS() => clearField(5);
}

class Character extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Character',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false;

  Character._() : super();
  factory Character({
    $core.String? title,
    $core.String? description,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory Character.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Character.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Character clone() => Character()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Character copyWith(void Function(Character) updates) =>
      super.copyWith((message) => updates(message as Character))
          as Character; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Character create() => Character._();
  Character createEmptyInstance() => create();
  static $pb.PbList<Character> createRepeated() => $pb.PbList<Character>();
  @$core.pragma('dart2js:noInline')
  static Character getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Character>(create);
  static Character? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class Lobby extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Lobby',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..m<$core.int, PlayerLobbyState>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        entryClassName: 'Lobby.StateEntry',
        keyFieldType: $pb.PbFieldType.OF3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: PlayerLobbyState.create,
        packageName: const $pb.PackageName('hat_game.state'))
    ..hasRequiredFields = false;

  Lobby._() : super();
  factory Lobby({
    $core.Map<$core.int, PlayerLobbyState>? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state.addAll(state);
    }
    return _result;
  }
  factory Lobby.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Lobby.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Lobby clone() => Lobby()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Lobby copyWith(void Function(Lobby) updates) =>
      super.copyWith((message) => updates(message as Lobby))
          as Lobby; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Lobby create() => Lobby._();
  Lobby createEmptyInstance() => create();
  static $pb.PbList<Lobby> createRepeated() => $pb.PbList<Lobby>();
  @$core.pragma('dart2js:noInline')
  static Lobby getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lobby>(create);
  static Lobby? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, PlayerLobbyState> get state => $_getMap(0);
}

class PlayerLobbyState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerLobbyState',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..pc<Character>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        $pb.PbFieldType.PM,
        subBuilder: Character.create)
    ..hasRequiredFields = false;

  PlayerLobbyState._() : super();
  factory PlayerLobbyState({
    $core.Iterable<Character>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory PlayerLobbyState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlayerLobbyState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlayerLobbyState clone() => PlayerLobbyState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlayerLobbyState copyWith(void Function(PlayerLobbyState) updates) =>
      super.copyWith((message) => updates(message as PlayerLobbyState))
          as PlayerLobbyState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerLobbyState create() => PlayerLobbyState._();
  PlayerLobbyState createEmptyInstance() => create();
  static $pb.PbList<PlayerLobbyState> createRepeated() => $pb.PbList<PlayerLobbyState>();
  @$core.pragma('dart2js:noInline')
  static PlayerLobbyState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerLobbyState>(create);
  static PlayerLobbyState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Character> get value => $_getList(0);
}

class RunningGameState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RunningGameState',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOM<TeamList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teams',
        subBuilder: TeamList.create)
    ..m<$fixnum.Int64, Character>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characters',
        entryClassName: 'RunningGameState.CharactersEntry',
        keyFieldType: $pb.PbFieldType.OF6,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Character.create,
        packageName: const $pb.PackageName('hat_game.state'))
    ..aOM<RoundPoints>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roundPoints',
        subBuilder: RoundPoints.create)
    ..hasRequiredFields = false;

  RunningGameState._() : super();
  factory RunningGameState({
    TeamList? teams,
    $core.Map<$fixnum.Int64, Character>? characters,
    RoundPoints? roundPoints,
  }) {
    final _result = create();
    if (teams != null) {
      _result.teams = teams;
    }
    if (characters != null) {
      _result.characters.addAll(characters);
    }
    if (roundPoints != null) {
      _result.roundPoints = roundPoints;
    }
    return _result;
  }
  factory RunningGameState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RunningGameState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RunningGameState clone() => RunningGameState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RunningGameState copyWith(void Function(RunningGameState) updates) =>
      super.copyWith((message) => updates(message as RunningGameState))
          as RunningGameState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RunningGameState create() => RunningGameState._();
  RunningGameState createEmptyInstance() => create();
  static $pb.PbList<RunningGameState> createRepeated() => $pb.PbList<RunningGameState>();
  @$core.pragma('dart2js:noInline')
  static RunningGameState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RunningGameState>(create);
  static RunningGameState? _defaultInstance;

  @$pb.TagNumber(1)
  TeamList get teams => $_getN(0);
  @$pb.TagNumber(1)
  set teams(TeamList v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTeams() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeams() => clearField(1);
  @$pb.TagNumber(1)
  TeamList ensureTeams() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.Map<$fixnum.Int64, Character> get characters => $_getMap(1);

  @$pb.TagNumber(3)
  RoundPoints get roundPoints => $_getN(2);
  @$pb.TagNumber(3)
  set roundPoints(RoundPoints v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoundPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoundPoints() => clearField(3);
  @$pb.TagNumber(3)
  RoundPoints ensureRoundPoints() => $_ensure(2);
}

class RoundPoints extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoundPoints',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..pc<PlayerPoints>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        $pb.PbFieldType.PM,
        subBuilder: PlayerPoints.create)
    ..hasRequiredFields = false;

  RoundPoints._() : super();
  factory RoundPoints({
    $core.Iterable<PlayerPoints>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory RoundPoints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoundPoints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoundPoints clone() => RoundPoints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoundPoints copyWith(void Function(RoundPoints) updates) =>
      super.copyWith((message) => updates(message as RoundPoints))
          as RoundPoints; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoundPoints create() => RoundPoints._();
  RoundPoints createEmptyInstance() => create();
  static $pb.PbList<RoundPoints> createRepeated() => $pb.PbList<RoundPoints>();
  @$core.pragma('dart2js:noInline')
  static RoundPoints getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoundPoints>(create);
  static RoundPoints? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlayerPoints> get value => $_getList(0);
}

class Team extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Team',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstPlayerId',
        $pb.PbFieldType.OF3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondPlayerId',
        $pb.PbFieldType.OF3)
    ..aOM<TeamProps>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'props',
        subBuilder: TeamProps.create)
    ..hasRequiredFields = false;

  Team._() : super();
  factory Team({
    $core.int? firstPlayerId,
    $core.int? secondPlayerId,
    TeamProps? props,
  }) {
    final _result = create();
    if (firstPlayerId != null) {
      _result.firstPlayerId = firstPlayerId;
    }
    if (secondPlayerId != null) {
      _result.secondPlayerId = secondPlayerId;
    }
    if (props != null) {
      _result.props = props;
    }
    return _result;
  }
  factory Team.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Team.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Team clone() => Team()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Team copyWith(void Function(Team) updates) =>
      super.copyWith((message) => updates(message as Team))
          as Team; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Team create() => Team._();
  Team createEmptyInstance() => create();
  static $pb.PbList<Team> createRepeated() => $pb.PbList<Team>();
  @$core.pragma('dart2js:noInline')
  static Team getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Team>(create);
  static Team? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get firstPlayerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set firstPlayerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirstPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get secondPlayerId => $_getIZ(1);
  @$pb.TagNumber(2)
  set secondPlayerId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSecondPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  TeamProps get props => $_getN(2);
  @$pb.TagNumber(3)
  set props(TeamProps v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProps() => $_has(2);
  @$pb.TagNumber(3)
  void clearProps() => clearField(3);
  @$pb.TagNumber(3)
  TeamProps ensureProps() => $_ensure(2);
}

class TeamProps extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamProps',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'styleId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  TeamProps._() : super();
  factory TeamProps({
    $core.String? name,
    $core.int? styleId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (styleId != null) {
      _result.styleId = styleId;
    }
    return _result;
  }
  factory TeamProps.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TeamProps.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TeamProps clone() => TeamProps()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TeamProps copyWith(void Function(TeamProps) updates) =>
      super.copyWith((message) => updates(message as TeamProps))
          as TeamProps; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamProps create() => TeamProps._();
  TeamProps createEmptyInstance() => create();
  static $pb.PbList<TeamProps> createRepeated() => $pb.PbList<TeamProps>();
  @$core.pragma('dart2js:noInline')
  static TeamProps getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamProps>(create);
  static TeamProps? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get styleId => $_getIZ(1);
  @$pb.TagNumber(2)
  set styleId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStyleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStyleId() => clearField(2);
}

class TeamList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamList',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..pc<Team>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        $pb.PbFieldType.PM,
        subBuilder: Team.create)
    ..hasRequiredFields = false;

  TeamList._() : super();
  factory TeamList({
    $core.Iterable<Team>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory TeamList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TeamList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TeamList clone() => TeamList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TeamList copyWith(void Function(TeamList) updates) =>
      super.copyWith((message) => updates(message as TeamList))
          as TeamList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamList create() => TeamList._();
  TeamList createEmptyInstance() => create();
  static $pb.PbList<TeamList> createRepeated() => $pb.PbList<TeamList>();
  @$core.pragma('dart2js:noInline')
  static TeamList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamList>(create);
  static TeamList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Team> get value => $_getList(0);
}

class PlayerPoints extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerPoints',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..m<$core.int, CharacterIdList>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        entryClassName: 'PlayerPoints.ValueEntry',
        keyFieldType: $pb.PbFieldType.OF3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: CharacterIdList.create,
        packageName: const $pb.PackageName('hat_game.state'))
    ..hasRequiredFields = false;

  PlayerPoints._() : super();
  factory PlayerPoints({
    $core.Map<$core.int, CharacterIdList>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory PlayerPoints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlayerPoints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlayerPoints clone() => PlayerPoints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlayerPoints copyWith(void Function(PlayerPoints) updates) =>
      super.copyWith((message) => updates(message as PlayerPoints))
          as PlayerPoints; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerPoints create() => PlayerPoints._();
  PlayerPoints createEmptyInstance() => create();
  static $pb.PbList<PlayerPoints> createRepeated() => $pb.PbList<PlayerPoints>();
  @$core.pragma('dart2js:noInline')
  static PlayerPoints getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerPoints>(create);
  static PlayerPoints? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, CharacterIdList> get value => $_getMap(0);
}

class CharacterIdList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterIdList',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characters',
        $pb.PbFieldType.KF6)
    ..hasRequiredFields = false;

  CharacterIdList._() : super();
  factory CharacterIdList({
    $core.Iterable<$fixnum.Int64>? characters,
  }) {
    final _result = create();
    if (characters != null) {
      _result.characters.addAll(characters);
    }
    return _result;
  }
  factory CharacterIdList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CharacterIdList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CharacterIdList clone() => CharacterIdList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CharacterIdList copyWith(void Function(CharacterIdList) updates) =>
      super.copyWith((message) => updates(message as CharacterIdList))
          as CharacterIdList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterIdList create() => CharacterIdList._();
  CharacterIdList createEmptyInstance() => create();
  static $pb.PbList<CharacterIdList> createRepeated() => $pb.PbList<CharacterIdList>();
  @$core.pragma('dart2js:noInline')
  static CharacterIdList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterIdList>(create);
  static CharacterIdList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get characters => $_getList(0);
}

enum Round_TurnState { overview, prepare, active, vote, voteCount, notSet }

class Round extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Round_TurnState> _Round_TurnStateByTag = {
    7: Round_TurnState.overview,
    8: Round_TurnState.prepare,
    9: Round_TurnState.active,
    10: Round_TurnState.vote,
    11: Round_TurnState.voteCount,
    0: Round_TurnState.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Round',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..oo(0, [7, 8, 9, 10, 11])
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roundIndex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnIndex',
        $pb.PbFieldType.OU3)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paused')
    ..aOM<CharacterIdList>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characterPool',
        subBuilder: CharacterIdList.create)
    ..aOM<PlayerPoints>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerPoints',
        subBuilder: PlayerPoints.create)
    ..aOM<RunningGameState>(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: RunningGameState.create)
    ..aOM<TurnOverview>(
        7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'overview',
        subBuilder: TurnOverview.create)
    ..aOM<TurnPrepare>(
        8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prepare',
        subBuilder: TurnPrepare.create)
    ..aOM<TurnActive>(
        9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active',
        subBuilder: TurnActive.create)
    ..aOM<TurnVote>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vote',
        subBuilder: TurnVote.create)
    ..aOM<TurnVoteCount>(
        11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voteCount',
        subBuilder: TurnVoteCount.create)
    ..hasRequiredFields = false;

  Round._() : super();
  factory Round({
    $core.int? roundIndex,
    $core.int? turnIndex,
    $core.bool? paused,
    CharacterIdList? characterPool,
    PlayerPoints? playerPoints,
    RunningGameState? state,
    TurnOverview? overview,
    TurnPrepare? prepare,
    TurnActive? active,
    TurnVote? vote,
    TurnVoteCount? voteCount,
  }) {
    final _result = create();
    if (roundIndex != null) {
      _result.roundIndex = roundIndex;
    }
    if (turnIndex != null) {
      _result.turnIndex = turnIndex;
    }
    if (paused != null) {
      _result.paused = paused;
    }
    if (characterPool != null) {
      _result.characterPool = characterPool;
    }
    if (playerPoints != null) {
      _result.playerPoints = playerPoints;
    }
    if (state != null) {
      _result.state = state;
    }
    if (overview != null) {
      _result.overview = overview;
    }
    if (prepare != null) {
      _result.prepare = prepare;
    }
    if (active != null) {
      _result.active = active;
    }
    if (vote != null) {
      _result.vote = vote;
    }
    if (voteCount != null) {
      _result.voteCount = voteCount;
    }
    return _result;
  }
  factory Round.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Round.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Round clone() => Round()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Round copyWith(void Function(Round) updates) =>
      super.copyWith((message) => updates(message as Round))
          as Round; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Round create() => Round._();
  Round createEmptyInstance() => create();
  static $pb.PbList<Round> createRepeated() => $pb.PbList<Round>();
  @$core.pragma('dart2js:noInline')
  static Round getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Round>(create);
  static Round? _defaultInstance;

  Round_TurnState whichTurnState() => _Round_TurnStateByTag[$_whichOneof(0)]!;
  void clearTurnState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get roundIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set roundIndex($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoundIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoundIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get turnIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set turnIndex($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTurnIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearTurnIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get paused => $_getBF(2);
  @$pb.TagNumber(3)
  set paused($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPaused() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaused() => clearField(3);

  @$pb.TagNumber(4)
  CharacterIdList get characterPool => $_getN(3);
  @$pb.TagNumber(4)
  set characterPool(CharacterIdList v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCharacterPool() => $_has(3);
  @$pb.TagNumber(4)
  void clearCharacterPool() => clearField(4);
  @$pb.TagNumber(4)
  CharacterIdList ensureCharacterPool() => $_ensure(3);

  @$pb.TagNumber(5)
  PlayerPoints get playerPoints => $_getN(4);
  @$pb.TagNumber(5)
  set playerPoints(PlayerPoints v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPlayerPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerPoints() => clearField(5);
  @$pb.TagNumber(5)
  PlayerPoints ensurePlayerPoints() => $_ensure(4);

  @$pb.TagNumber(6)
  RunningGameState get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(RunningGameState v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);
  @$pb.TagNumber(6)
  RunningGameState ensureState() => $_ensure(5);

  @$pb.TagNumber(7)
  TurnOverview get overview => $_getN(6);
  @$pb.TagNumber(7)
  set overview(TurnOverview v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOverview() => $_has(6);
  @$pb.TagNumber(7)
  void clearOverview() => clearField(7);
  @$pb.TagNumber(7)
  TurnOverview ensureOverview() => $_ensure(6);

  @$pb.TagNumber(8)
  TurnPrepare get prepare => $_getN(7);
  @$pb.TagNumber(8)
  set prepare(TurnPrepare v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPrepare() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrepare() => clearField(8);
  @$pb.TagNumber(8)
  TurnPrepare ensurePrepare() => $_ensure(7);

  @$pb.TagNumber(9)
  TurnActive get active => $_getN(8);
  @$pb.TagNumber(9)
  set active(TurnActive v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasActive() => $_has(8);
  @$pb.TagNumber(9)
  void clearActive() => clearField(9);
  @$pb.TagNumber(9)
  TurnActive ensureActive() => $_ensure(8);

  @$pb.TagNumber(10)
  TurnVote get vote => $_getN(9);
  @$pb.TagNumber(10)
  set vote(TurnVote v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasVote() => $_has(9);
  @$pb.TagNumber(10)
  void clearVote() => clearField(10);
  @$pb.TagNumber(10)
  TurnVote ensureVote() => $_ensure(9);

  @$pb.TagNumber(11)
  TurnVoteCount get voteCount => $_getN(10);
  @$pb.TagNumber(11)
  set voteCount(TurnVoteCount v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVoteCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoteCount() => clearField(11);
  @$pb.TagNumber(11)
  TurnVoteCount ensureVoteCount() => $_ensure(10);
}

class TurnOverview extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TurnOverview',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TurnOverview._() : super();
  factory TurnOverview() => create();
  factory TurnOverview.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TurnOverview.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TurnOverview clone() => TurnOverview()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TurnOverview copyWith(void Function(TurnOverview) updates) =>
      super.copyWith((message) => updates(message as TurnOverview))
          as TurnOverview; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TurnOverview create() => TurnOverview._();
  TurnOverview createEmptyInstance() => create();
  static $pb.PbList<TurnOverview> createRepeated() => $pb.PbList<TurnOverview>();
  @$core.pragma('dart2js:noInline')
  static TurnOverview getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnOverview>(create);
  static TurnOverview? _defaultInstance;
}

class TurnPrepare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TurnPrepare',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TurnPrepare._() : super();
  factory TurnPrepare() => create();
  factory TurnPrepare.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TurnPrepare.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TurnPrepare clone() => TurnPrepare()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TurnPrepare copyWith(void Function(TurnPrepare) updates) =>
      super.copyWith((message) => updates(message as TurnPrepare))
          as TurnPrepare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TurnPrepare create() => TurnPrepare._();
  TurnPrepare createEmptyInstance() => create();
  static $pb.PbList<TurnPrepare> createRepeated() => $pb.PbList<TurnPrepare>();
  @$core.pragma('dart2js:noInline')
  static TurnPrepare getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnPrepare>(create);
  static TurnPrepare? _defaultInstance;
}

class TurnActive extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TurnActive',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TurnActive._() : super();
  factory TurnActive() => create();
  factory TurnActive.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TurnActive.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TurnActive clone() => TurnActive()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TurnActive copyWith(void Function(TurnActive) updates) =>
      super.copyWith((message) => updates(message as TurnActive))
          as TurnActive; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TurnActive create() => TurnActive._();
  TurnActive createEmptyInstance() => create();
  static $pb.PbList<TurnActive> createRepeated() => $pb.PbList<TurnActive>();
  @$core.pragma('dart2js:noInline')
  static TurnActive getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnActive>(create);
  static TurnActive? _defaultInstance;
}

class TurnVote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TurnVote',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..e<TurnEndReason>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason',
        $pb.PbFieldType.OE,
        defaultOrMaker: TurnEndReason.TIMEOUT,
        valueOf: TurnEndReason.valueOf,
        enumValues: TurnEndReason.values)
    ..aOM<CharacterIdList>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guessed',
        subBuilder: CharacterIdList.create)
    ..m<$core.int, VoteResult>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerVote',
        entryClassName: 'TurnVote.PlayerVoteEntry',
        keyFieldType: $pb.PbFieldType.OF3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: VoteResult.create,
        packageName: const $pb.PackageName('hat_game.state'))
    ..hasRequiredFields = false;

  TurnVote._() : super();
  factory TurnVote({
    TurnEndReason? reason,
    CharacterIdList? guessed,
    $core.Map<$core.int, VoteResult>? playerVote,
  }) {
    final _result = create();
    if (reason != null) {
      _result.reason = reason;
    }
    if (guessed != null) {
      _result.guessed = guessed;
    }
    if (playerVote != null) {
      _result.playerVote.addAll(playerVote);
    }
    return _result;
  }
  factory TurnVote.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TurnVote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TurnVote clone() => TurnVote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TurnVote copyWith(void Function(TurnVote) updates) =>
      super.copyWith((message) => updates(message as TurnVote))
          as TurnVote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TurnVote create() => TurnVote._();
  TurnVote createEmptyInstance() => create();
  static $pb.PbList<TurnVote> createRepeated() => $pb.PbList<TurnVote>();
  @$core.pragma('dart2js:noInline')
  static TurnVote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnVote>(create);
  static TurnVote? _defaultInstance;

  @$pb.TagNumber(1)
  TurnEndReason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(TurnEndReason v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);

  @$pb.TagNumber(2)
  CharacterIdList get guessed => $_getN(1);
  @$pb.TagNumber(2)
  set guessed(CharacterIdList v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGuessed() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuessed() => clearField(2);
  @$pb.TagNumber(2)
  CharacterIdList ensureGuessed() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.int, VoteResult> get playerVote => $_getMap(2);
}

class VoteResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoteResult',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..pc<CharacterVote>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        $pb.PbFieldType.PM,
        subBuilder: CharacterVote.create)
    ..hasRequiredFields = false;

  VoteResult._() : super();
  factory VoteResult({
    $core.Iterable<CharacterVote>? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory VoteResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteResult clone() => VoteResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteResult copyWith(void Function(VoteResult) updates) =>
      super.copyWith((message) => updates(message as VoteResult))
          as VoteResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteResult create() => VoteResult._();
  VoteResult createEmptyInstance() => create();
  static $pb.PbList<VoteResult> createRepeated() => $pb.PbList<VoteResult>();
  @$core.pragma('dart2js:noInline')
  static VoteResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteResult>(create);
  static VoteResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CharacterVote> get value => $_getList(0);
}

class CharacterVote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterVote',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characterId',
        $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<CharacterVoteOutcome>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'outcome',
        $pb.PbFieldType.OE,
        defaultOrMaker: CharacterVoteOutcome.APPROVED,
        valueOf: CharacterVoteOutcome.valueOf,
        enumValues: CharacterVoteOutcome.values)
    ..hasRequiredFields = false;

  CharacterVote._() : super();
  factory CharacterVote({
    $fixnum.Int64? characterId,
    CharacterVoteOutcome? outcome,
  }) {
    final _result = create();
    if (characterId != null) {
      _result.characterId = characterId;
    }
    if (outcome != null) {
      _result.outcome = outcome;
    }
    return _result;
  }
  factory CharacterVote.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CharacterVote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CharacterVote clone() => CharacterVote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CharacterVote copyWith(void Function(CharacterVote) updates) =>
      super.copyWith((message) => updates(message as CharacterVote))
          as CharacterVote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterVote create() => CharacterVote._();
  CharacterVote createEmptyInstance() => create();
  static $pb.PbList<CharacterVote> createRepeated() => $pb.PbList<CharacterVote>();
  @$core.pragma('dart2js:noInline')
  static CharacterVote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterVote>(create);
  static CharacterVote? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get characterId => $_getI64(0);
  @$pb.TagNumber(1)
  set characterId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCharacterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacterId() => clearField(1);

  @$pb.TagNumber(2)
  CharacterVoteOutcome get outcome => $_getN(1);
  @$pb.TagNumber(2)
  set outcome(CharacterVoteOutcome v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOutcome() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutcome() => clearField(2);
}

class TurnVoteCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TurnVoteCount',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOM<VoteResult>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result',
        subBuilder: VoteResult.create)
    ..hasRequiredFields = false;

  TurnVoteCount._() : super();
  factory TurnVoteCount({
    VoteResult? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory TurnVoteCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TurnVoteCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TurnVoteCount clone() => TurnVoteCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TurnVoteCount copyWith(void Function(TurnVoteCount) updates) =>
      super.copyWith((message) => updates(message as TurnVoteCount))
          as TurnVoteCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TurnVoteCount create() => TurnVoteCount._();
  TurnVoteCount createEmptyInstance() => create();
  static $pb.PbList<TurnVoteCount> createRepeated() => $pb.PbList<TurnVoteCount>();
  @$core.pragma('dart2js:noInline')
  static TurnVoteCount getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TurnVoteCount>(create);
  static TurnVoteCount? _defaultInstance;

  @$pb.TagNumber(1)
  VoteResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(VoteResult v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  VoteResult ensureResult() => $_ensure(0);
}

enum GameStatePatch_Kind {
  playerJoined,
  playerLeft,
  playerReady,
  playerNotReady,
  playerDisconnected,
  playerConnected,
  prepareStart,
  pause,
  roundNext,
  turnNext,
  turnStart,
  turnEnd,
  votePlayer,
  voteCount,
  gameFinished,
  notSet
}

class GameStatePatch extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameStatePatch_Kind> _GameStatePatch_KindByTag = {
    10: GameStatePatch_Kind.playerJoined,
    11: GameStatePatch_Kind.playerLeft,
    12: GameStatePatch_Kind.playerReady,
    13: GameStatePatch_Kind.playerNotReady,
    14: GameStatePatch_Kind.playerDisconnected,
    15: GameStatePatch_Kind.playerConnected,
    16: GameStatePatch_Kind.prepareStart,
    17: GameStatePatch_Kind.pause,
    18: GameStatePatch_Kind.roundNext,
    19: GameStatePatch_Kind.turnNext,
    20: GameStatePatch_Kind.turnStart,
    21: GameStatePatch_Kind.turnEnd,
    22: GameStatePatch_Kind.votePlayer,
    23: GameStatePatch_Kind.voteCount,
    24: GameStatePatch_Kind.gameFinished,
    0: GameStatePatch_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameStatePatch',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rev',
        $pb.PbFieldType.OU3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirm')
    ..aOM<DoPlayerJoined>(
        10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerJoined',
        subBuilder: DoPlayerJoined.create)
    ..aOM<DoPlayerLeft>(
        11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerLeft',
        subBuilder: DoPlayerLeft.create)
    ..aOM<DoPlayerReady>(
        12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerReady',
        subBuilder: DoPlayerReady.create)
    ..aOM<DoPlayerNotReady>(
        13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerNotReady',
        subBuilder: DoPlayerNotReady.create)
    ..aOM<DoPlayerDisconnected>(14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerDisconnected',
        subBuilder: DoPlayerDisconnected.create)
    ..aOM<DoPlayerConnected>(
        15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerConnected',
        subBuilder: DoPlayerConnected.create)
    ..aOM<DoPrepareStart>(
        16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prepareStart',
        subBuilder: DoPrepareStart.create)
    ..aOM<DoPause>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pause',
        subBuilder: DoPause.create)
    ..aOM<DoNextRound>(
        18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roundNext',
        subBuilder: DoNextRound.create)
    ..aOM<DoNextTurn>(
        19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnNext',
        subBuilder: DoNextTurn.create)
    ..aOM<DoStartTurn>(
        20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnStart',
        subBuilder: DoStartTurn.create)
    ..aOM<DoEndTurn>(
        21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnEnd',
        subBuilder: DoEndTurn.create)
    ..aOM<DoPlayerVoted>(
        22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'votePlayer',
        subBuilder: DoPlayerVoted.create)
    ..aOM<DoVoteCount>(
        23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voteCount',
        subBuilder: DoVoteCount.create)
    ..aOM<DoGameFinished>(
        24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameFinished',
        subBuilder: DoGameFinished.create)
    ..hasRequiredFields = false;

  GameStatePatch._() : super();
  factory GameStatePatch({
    $core.int? rev,
    $core.bool? confirm,
    DoPlayerJoined? playerJoined,
    DoPlayerLeft? playerLeft,
    DoPlayerReady? playerReady,
    DoPlayerNotReady? playerNotReady,
    DoPlayerDisconnected? playerDisconnected,
    DoPlayerConnected? playerConnected,
    DoPrepareStart? prepareStart,
    DoPause? pause,
    DoNextRound? roundNext,
    DoNextTurn? turnNext,
    DoStartTurn? turnStart,
    DoEndTurn? turnEnd,
    DoPlayerVoted? votePlayer,
    DoVoteCount? voteCount,
    DoGameFinished? gameFinished,
  }) {
    final _result = create();
    if (rev != null) {
      _result.rev = rev;
    }
    if (confirm != null) {
      _result.confirm = confirm;
    }
    if (playerJoined != null) {
      _result.playerJoined = playerJoined;
    }
    if (playerLeft != null) {
      _result.playerLeft = playerLeft;
    }
    if (playerReady != null) {
      _result.playerReady = playerReady;
    }
    if (playerNotReady != null) {
      _result.playerNotReady = playerNotReady;
    }
    if (playerDisconnected != null) {
      _result.playerDisconnected = playerDisconnected;
    }
    if (playerConnected != null) {
      _result.playerConnected = playerConnected;
    }
    if (prepareStart != null) {
      _result.prepareStart = prepareStart;
    }
    if (pause != null) {
      _result.pause = pause;
    }
    if (roundNext != null) {
      _result.roundNext = roundNext;
    }
    if (turnNext != null) {
      _result.turnNext = turnNext;
    }
    if (turnStart != null) {
      _result.turnStart = turnStart;
    }
    if (turnEnd != null) {
      _result.turnEnd = turnEnd;
    }
    if (votePlayer != null) {
      _result.votePlayer = votePlayer;
    }
    if (voteCount != null) {
      _result.voteCount = voteCount;
    }
    if (gameFinished != null) {
      _result.gameFinished = gameFinished;
    }
    return _result;
  }
  factory GameStatePatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameStatePatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameStatePatch clone() => GameStatePatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameStatePatch copyWith(void Function(GameStatePatch) updates) =>
      super.copyWith((message) => updates(message as GameStatePatch))
          as GameStatePatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameStatePatch create() => GameStatePatch._();
  GameStatePatch createEmptyInstance() => create();
  static $pb.PbList<GameStatePatch> createRepeated() => $pb.PbList<GameStatePatch>();
  @$core.pragma('dart2js:noInline')
  static GameStatePatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameStatePatch>(create);
  static GameStatePatch? _defaultInstance;

  GameStatePatch_Kind whichKind() => _GameStatePatch_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get rev => $_getIZ(0);
  @$pb.TagNumber(1)
  set rev($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRev() => $_has(0);
  @$pb.TagNumber(1)
  void clearRev() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get confirm => $_getBF(1);
  @$pb.TagNumber(2)
  set confirm($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfirm() => clearField(2);

  @$pb.TagNumber(10)
  DoPlayerJoined get playerJoined => $_getN(2);
  @$pb.TagNumber(10)
  set playerJoined(DoPlayerJoined v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPlayerJoined() => $_has(2);
  @$pb.TagNumber(10)
  void clearPlayerJoined() => clearField(10);
  @$pb.TagNumber(10)
  DoPlayerJoined ensurePlayerJoined() => $_ensure(2);

  @$pb.TagNumber(11)
  DoPlayerLeft get playerLeft => $_getN(3);
  @$pb.TagNumber(11)
  set playerLeft(DoPlayerLeft v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPlayerLeft() => $_has(3);
  @$pb.TagNumber(11)
  void clearPlayerLeft() => clearField(11);
  @$pb.TagNumber(11)
  DoPlayerLeft ensurePlayerLeft() => $_ensure(3);

  @$pb.TagNumber(12)
  DoPlayerReady get playerReady => $_getN(4);
  @$pb.TagNumber(12)
  set playerReady(DoPlayerReady v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPlayerReady() => $_has(4);
  @$pb.TagNumber(12)
  void clearPlayerReady() => clearField(12);
  @$pb.TagNumber(12)
  DoPlayerReady ensurePlayerReady() => $_ensure(4);

  @$pb.TagNumber(13)
  DoPlayerNotReady get playerNotReady => $_getN(5);
  @$pb.TagNumber(13)
  set playerNotReady(DoPlayerNotReady v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPlayerNotReady() => $_has(5);
  @$pb.TagNumber(13)
  void clearPlayerNotReady() => clearField(13);
  @$pb.TagNumber(13)
  DoPlayerNotReady ensurePlayerNotReady() => $_ensure(5);

  @$pb.TagNumber(14)
  DoPlayerDisconnected get playerDisconnected => $_getN(6);
  @$pb.TagNumber(14)
  set playerDisconnected(DoPlayerDisconnected v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPlayerDisconnected() => $_has(6);
  @$pb.TagNumber(14)
  void clearPlayerDisconnected() => clearField(14);
  @$pb.TagNumber(14)
  DoPlayerDisconnected ensurePlayerDisconnected() => $_ensure(6);

  @$pb.TagNumber(15)
  DoPlayerConnected get playerConnected => $_getN(7);
  @$pb.TagNumber(15)
  set playerConnected(DoPlayerConnected v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPlayerConnected() => $_has(7);
  @$pb.TagNumber(15)
  void clearPlayerConnected() => clearField(15);
  @$pb.TagNumber(15)
  DoPlayerConnected ensurePlayerConnected() => $_ensure(7);

  @$pb.TagNumber(16)
  DoPrepareStart get prepareStart => $_getN(8);
  @$pb.TagNumber(16)
  set prepareStart(DoPrepareStart v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasPrepareStart() => $_has(8);
  @$pb.TagNumber(16)
  void clearPrepareStart() => clearField(16);
  @$pb.TagNumber(16)
  DoPrepareStart ensurePrepareStart() => $_ensure(8);

  @$pb.TagNumber(17)
  DoPause get pause => $_getN(9);
  @$pb.TagNumber(17)
  set pause(DoPause v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPause() => $_has(9);
  @$pb.TagNumber(17)
  void clearPause() => clearField(17);
  @$pb.TagNumber(17)
  DoPause ensurePause() => $_ensure(9);

  @$pb.TagNumber(18)
  DoNextRound get roundNext => $_getN(10);
  @$pb.TagNumber(18)
  set roundNext(DoNextRound v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRoundNext() => $_has(10);
  @$pb.TagNumber(18)
  void clearRoundNext() => clearField(18);
  @$pb.TagNumber(18)
  DoNextRound ensureRoundNext() => $_ensure(10);

  @$pb.TagNumber(19)
  DoNextTurn get turnNext => $_getN(11);
  @$pb.TagNumber(19)
  set turnNext(DoNextTurn v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTurnNext() => $_has(11);
  @$pb.TagNumber(19)
  void clearTurnNext() => clearField(19);
  @$pb.TagNumber(19)
  DoNextTurn ensureTurnNext() => $_ensure(11);

  @$pb.TagNumber(20)
  DoStartTurn get turnStart => $_getN(12);
  @$pb.TagNumber(20)
  set turnStart(DoStartTurn v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTurnStart() => $_has(12);
  @$pb.TagNumber(20)
  void clearTurnStart() => clearField(20);
  @$pb.TagNumber(20)
  DoStartTurn ensureTurnStart() => $_ensure(12);

  @$pb.TagNumber(21)
  DoEndTurn get turnEnd => $_getN(13);
  @$pb.TagNumber(21)
  set turnEnd(DoEndTurn v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTurnEnd() => $_has(13);
  @$pb.TagNumber(21)
  void clearTurnEnd() => clearField(21);
  @$pb.TagNumber(21)
  DoEndTurn ensureTurnEnd() => $_ensure(13);

  @$pb.TagNumber(22)
  DoPlayerVoted get votePlayer => $_getN(14);
  @$pb.TagNumber(22)
  set votePlayer(DoPlayerVoted v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasVotePlayer() => $_has(14);
  @$pb.TagNumber(22)
  void clearVotePlayer() => clearField(22);
  @$pb.TagNumber(22)
  DoPlayerVoted ensureVotePlayer() => $_ensure(14);

  @$pb.TagNumber(23)
  DoVoteCount get voteCount => $_getN(15);
  @$pb.TagNumber(23)
  set voteCount(DoVoteCount v) {
    setField(23, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasVoteCount() => $_has(15);
  @$pb.TagNumber(23)
  void clearVoteCount() => clearField(23);
  @$pb.TagNumber(23)
  DoVoteCount ensureVoteCount() => $_ensure(15);

  @$pb.TagNumber(24)
  DoGameFinished get gameFinished => $_getN(16);
  @$pb.TagNumber(24)
  set gameFinished(DoGameFinished v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasGameFinished() => $_has(16);
  @$pb.TagNumber(24)
  void clearGameFinished() => clearField(24);
  @$pb.TagNumber(24)
  DoGameFinished ensureGameFinished() => $_ensure(16);
}

enum DoHandshake_Result { ok, err, notSet }

class DoHandshake extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DoHandshake_Result> _DoHandshake_ResultByTag = {
    1: DoHandshake_Result.ok,
    2: DoHandshake_Result.err,
    0: DoHandshake_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoHandshake',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$0.Empty>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok',
        subBuilder: $0.Empty.create)
    ..aOM<$0.ProtocolError>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'err',
        subBuilder: $0.ProtocolError.create)
    ..hasRequiredFields = false;

  DoHandshake._() : super();
  factory DoHandshake({
    $0.Empty? ok,
    $0.ProtocolError? err,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (err != null) {
      _result.err = err;
    }
    return _result;
  }
  factory DoHandshake.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoHandshake.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoHandshake clone() => DoHandshake()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoHandshake copyWith(void Function(DoHandshake) updates) =>
      super.copyWith((message) => updates(message as DoHandshake))
          as DoHandshake; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoHandshake create() => DoHandshake._();
  DoHandshake createEmptyInstance() => create();
  static $pb.PbList<DoHandshake> createRepeated() => $pb.PbList<DoHandshake>();
  @$core.pragma('dart2js:noInline')
  static DoHandshake getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoHandshake>(create);
  static DoHandshake? _defaultInstance;

  DoHandshake_Result whichResult() => _DoHandshake_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Empty get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok($0.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  $0.Empty ensureOk() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.ProtocolError get err => $_getN(1);
  @$pb.TagNumber(2)
  set err($0.ProtocolError v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErr() => $_has(1);
  @$pb.TagNumber(2)
  void clearErr() => clearField(2);
  @$pb.TagNumber(2)
  $0.ProtocolError ensureErr() => $_ensure(1);
}

class DoGameClosed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoGameClosed',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  DoGameClosed._() : super();
  factory DoGameClosed() => create();
  factory DoGameClosed.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoGameClosed.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoGameClosed clone() => DoGameClosed()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoGameClosed copyWith(void Function(DoGameClosed) updates) =>
      super.copyWith((message) => updates(message as DoGameClosed))
          as DoGameClosed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoGameClosed create() => DoGameClosed._();
  DoGameClosed createEmptyInstance() => create();
  static $pb.PbList<DoGameClosed> createRepeated() => $pb.PbList<DoGameClosed>();
  @$core.pragma('dart2js:noInline')
  static DoGameClosed getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoGameClosed>(create);
  static DoGameClosed? _defaultInstance;
}

class DoRewind extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoRewind',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOM<GameState>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: GameState.create)
    ..hasRequiredFields = false;

  DoRewind._() : super();
  factory DoRewind({
    GameState? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory DoRewind.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoRewind.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoRewind clone() => DoRewind()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoRewind copyWith(void Function(DoRewind) updates) =>
      super.copyWith((message) => updates(message as DoRewind))
          as DoRewind; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoRewind create() => DoRewind._();
  DoRewind createEmptyInstance() => create();
  static $pb.PbList<DoRewind> createRepeated() => $pb.PbList<DoRewind>();
  @$core.pragma('dart2js:noInline')
  static DoRewind getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoRewind>(create);
  static DoRewind? _defaultInstance;

  @$pb.TagNumber(1)
  GameState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(GameState v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  GameState ensureState() => $_ensure(0);
}

class DoPlayerJoined extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerJoined',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..aOM<Player>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'player',
        subBuilder: Player.create)
    ..hasRequiredFields = false;

  DoPlayerJoined._() : super();
  factory DoPlayerJoined({
    $core.int? playerId,
    Player? player,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (player != null) {
      _result.player = player;
    }
    return _result;
  }
  factory DoPlayerJoined.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerJoined.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerJoined clone() => DoPlayerJoined()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerJoined copyWith(void Function(DoPlayerJoined) updates) =>
      super.copyWith((message) => updates(message as DoPlayerJoined))
          as DoPlayerJoined; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerJoined create() => DoPlayerJoined._();
  DoPlayerJoined createEmptyInstance() => create();
  static $pb.PbList<DoPlayerJoined> createRepeated() => $pb.PbList<DoPlayerJoined>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerJoined getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerJoined>(create);
  static DoPlayerJoined? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  Player get player => $_getN(1);
  @$pb.TagNumber(2)
  set player(Player v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayer() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayer() => clearField(2);
  @$pb.TagNumber(2)
  Player ensurePlayer() => $_ensure(1);
}

class DoPlayerLeft extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerLeft',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  DoPlayerLeft._() : super();
  factory DoPlayerLeft({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory DoPlayerLeft.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerLeft.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerLeft clone() => DoPlayerLeft()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerLeft copyWith(void Function(DoPlayerLeft) updates) =>
      super.copyWith((message) => updates(message as DoPlayerLeft))
          as DoPlayerLeft; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerLeft create() => DoPlayerLeft._();
  DoPlayerLeft createEmptyInstance() => create();
  static $pb.PbList<DoPlayerLeft> createRepeated() => $pb.PbList<DoPlayerLeft>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerLeft getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerLeft>(create);
  static DoPlayerLeft? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class DoPlayerReady extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerReady',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..pc<Character>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characters',
        $pb.PbFieldType.PM,
        subBuilder: Character.create)
    ..hasRequiredFields = false;

  DoPlayerReady._() : super();
  factory DoPlayerReady({
    $core.int? playerId,
    $core.Iterable<Character>? characters,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (characters != null) {
      _result.characters.addAll(characters);
    }
    return _result;
  }
  factory DoPlayerReady.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerReady.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerReady clone() => DoPlayerReady()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerReady copyWith(void Function(DoPlayerReady) updates) =>
      super.copyWith((message) => updates(message as DoPlayerReady))
          as DoPlayerReady; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerReady create() => DoPlayerReady._();
  DoPlayerReady createEmptyInstance() => create();
  static $pb.PbList<DoPlayerReady> createRepeated() => $pb.PbList<DoPlayerReady>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerReady getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerReady>(create);
  static DoPlayerReady? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Character> get characters => $_getList(1);
}

class DoPlayerNotReady extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerNotReady',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  DoPlayerNotReady._() : super();
  factory DoPlayerNotReady({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory DoPlayerNotReady.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerNotReady.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerNotReady clone() => DoPlayerNotReady()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerNotReady copyWith(void Function(DoPlayerNotReady) updates) =>
      super.copyWith((message) => updates(message as DoPlayerNotReady))
          as DoPlayerNotReady; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerNotReady create() => DoPlayerNotReady._();
  DoPlayerNotReady createEmptyInstance() => create();
  static $pb.PbList<DoPlayerNotReady> createRepeated() => $pb.PbList<DoPlayerNotReady>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerNotReady getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerNotReady>(create);
  static DoPlayerNotReady? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class DoPlayerDisconnected extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerDisconnected',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  DoPlayerDisconnected._() : super();
  factory DoPlayerDisconnected({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory DoPlayerDisconnected.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerDisconnected.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerDisconnected clone() => DoPlayerDisconnected()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerDisconnected copyWith(void Function(DoPlayerDisconnected) updates) =>
      super.copyWith((message) => updates(message as DoPlayerDisconnected))
          as DoPlayerDisconnected; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerDisconnected create() => DoPlayerDisconnected._();
  DoPlayerDisconnected createEmptyInstance() => create();
  static $pb.PbList<DoPlayerDisconnected> createRepeated() => $pb.PbList<DoPlayerDisconnected>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerDisconnected getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerDisconnected>(create);
  static DoPlayerDisconnected? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class DoPlayerConnected extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerConnected',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  DoPlayerConnected._() : super();
  factory DoPlayerConnected({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory DoPlayerConnected.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerConnected.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerConnected clone() => DoPlayerConnected()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerConnected copyWith(void Function(DoPlayerConnected) updates) =>
      super.copyWith((message) => updates(message as DoPlayerConnected))
          as DoPlayerConnected; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerConnected create() => DoPlayerConnected._();
  DoPlayerConnected createEmptyInstance() => create();
  static $pb.PbList<DoPlayerConnected> createRepeated() => $pb.PbList<DoPlayerConnected>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerConnected getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerConnected>(create);
  static DoPlayerConnected? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class DoPrepareStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPrepareStart',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOM<TeamList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teams',
        subBuilder: TeamList.create)
    ..hasRequiredFields = false;

  DoPrepareStart._() : super();
  factory DoPrepareStart({
    TeamList? teams,
  }) {
    final _result = create();
    if (teams != null) {
      _result.teams = teams;
    }
    return _result;
  }
  factory DoPrepareStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPrepareStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPrepareStart clone() => DoPrepareStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPrepareStart copyWith(void Function(DoPrepareStart) updates) =>
      super.copyWith((message) => updates(message as DoPrepareStart))
          as DoPrepareStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPrepareStart create() => DoPrepareStart._();
  DoPrepareStart createEmptyInstance() => create();
  static $pb.PbList<DoPrepareStart> createRepeated() => $pb.PbList<DoPrepareStart>();
  @$core.pragma('dart2js:noInline')
  static DoPrepareStart getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPrepareStart>(create);
  static DoPrepareStart? _defaultInstance;

  @$pb.TagNumber(1)
  TeamList get teams => $_getN(0);
  @$pb.TagNumber(1)
  set teams(TeamList v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTeams() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeams() => clearField(1);
  @$pb.TagNumber(1)
  TeamList ensureTeams() => $_ensure(0);
}

class DoPause extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPause',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..hasRequiredFields = false;

  DoPause._() : super();
  factory DoPause({
    $core.bool? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory DoPause.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPause.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPause clone() => DoPause()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPause copyWith(void Function(DoPause) updates) =>
      super.copyWith((message) => updates(message as DoPause))
          as DoPause; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPause create() => DoPause._();
  DoPause createEmptyInstance() => create();
  static $pb.PbList<DoPause> createRepeated() => $pb.PbList<DoPause>();
  @$core.pragma('dart2js:noInline')
  static DoPause getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPause>(create);
  static DoPause? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get state => $_getBF(0);
  @$pb.TagNumber(1)
  set state($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class DoNextRound extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoNextRound',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roundIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DoNextRound._() : super();
  factory DoNextRound({
    $core.int? roundIndex,
  }) {
    final _result = create();
    if (roundIndex != null) {
      _result.roundIndex = roundIndex;
    }
    return _result;
  }
  factory DoNextRound.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoNextRound.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoNextRound clone() => DoNextRound()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoNextRound copyWith(void Function(DoNextRound) updates) =>
      super.copyWith((message) => updates(message as DoNextRound))
          as DoNextRound; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoNextRound create() => DoNextRound._();
  DoNextRound createEmptyInstance() => create();
  static $pb.PbList<DoNextRound> createRepeated() => $pb.PbList<DoNextRound>();
  @$core.pragma('dart2js:noInline')
  static DoNextRound getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoNextRound>(create);
  static DoNextRound? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roundIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set roundIndex($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoundIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoundIndex() => clearField(1);
}

class DoNextTurn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoNextTurn',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DoNextTurn._() : super();
  factory DoNextTurn({
    $core.int? turnIndex,
  }) {
    final _result = create();
    if (turnIndex != null) {
      _result.turnIndex = turnIndex;
    }
    return _result;
  }
  factory DoNextTurn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoNextTurn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoNextTurn clone() => DoNextTurn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoNextTurn copyWith(void Function(DoNextTurn) updates) =>
      super.copyWith((message) => updates(message as DoNextTurn))
          as DoNextTurn; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoNextTurn create() => DoNextTurn._();
  DoNextTurn createEmptyInstance() => create();
  static $pb.PbList<DoNextTurn> createRepeated() => $pb.PbList<DoNextTurn>();
  @$core.pragma('dart2js:noInline')
  static DoNextTurn getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoNextTurn>(create);
  static DoNextTurn? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get turnIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set turnIndex($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTurnIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearTurnIndex() => clearField(1);
}

class DoStartTurn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoStartTurn',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  DoStartTurn._() : super();
  factory DoStartTurn() => create();
  factory DoStartTurn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoStartTurn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoStartTurn clone() => DoStartTurn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoStartTurn copyWith(void Function(DoStartTurn) updates) =>
      super.copyWith((message) => updates(message as DoStartTurn))
          as DoStartTurn; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoStartTurn create() => DoStartTurn._();
  DoStartTurn createEmptyInstance() => create();
  static $pb.PbList<DoStartTurn> createRepeated() => $pb.PbList<DoStartTurn>();
  @$core.pragma('dart2js:noInline')
  static DoStartTurn getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoStartTurn>(create);
  static DoStartTurn? _defaultInstance;
}

class DoEndTurn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoEndTurn',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..e<TurnEndReason>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason',
        $pb.PbFieldType.OE,
        defaultOrMaker: TurnEndReason.TIMEOUT,
        valueOf: TurnEndReason.valueOf,
        enumValues: TurnEndReason.values)
    ..aOM<CharacterIdList>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guessed',
        subBuilder: CharacterIdList.create)
    ..hasRequiredFields = false;

  DoEndTurn._() : super();
  factory DoEndTurn({
    TurnEndReason? reason,
    CharacterIdList? guessed,
  }) {
    final _result = create();
    if (reason != null) {
      _result.reason = reason;
    }
    if (guessed != null) {
      _result.guessed = guessed;
    }
    return _result;
  }
  factory DoEndTurn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoEndTurn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoEndTurn clone() => DoEndTurn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoEndTurn copyWith(void Function(DoEndTurn) updates) =>
      super.copyWith((message) => updates(message as DoEndTurn))
          as DoEndTurn; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoEndTurn create() => DoEndTurn._();
  DoEndTurn createEmptyInstance() => create();
  static $pb.PbList<DoEndTurn> createRepeated() => $pb.PbList<DoEndTurn>();
  @$core.pragma('dart2js:noInline')
  static DoEndTurn getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoEndTurn>(create);
  static DoEndTurn? _defaultInstance;

  @$pb.TagNumber(1)
  TurnEndReason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(TurnEndReason v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);

  @$pb.TagNumber(2)
  CharacterIdList get guessed => $_getN(1);
  @$pb.TagNumber(2)
  set guessed(CharacterIdList v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGuessed() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuessed() => clearField(2);
  @$pb.TagNumber(2)
  CharacterIdList ensureGuessed() => $_ensure(1);
}

class DoPlayerVoted extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoPlayerVoted',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId',
        $pb.PbFieldType.OF3)
    ..aOM<VoteResult>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result',
        subBuilder: VoteResult.create)
    ..hasRequiredFields = false;

  DoPlayerVoted._() : super();
  factory DoPlayerVoted({
    $core.int? playerId,
    VoteResult? result,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory DoPlayerVoted.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoPlayerVoted.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoPlayerVoted clone() => DoPlayerVoted()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoPlayerVoted copyWith(void Function(DoPlayerVoted) updates) =>
      super.copyWith((message) => updates(message as DoPlayerVoted))
          as DoPlayerVoted; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoPlayerVoted create() => DoPlayerVoted._();
  DoPlayerVoted createEmptyInstance() => create();
  static $pb.PbList<DoPlayerVoted> createRepeated() => $pb.PbList<DoPlayerVoted>();
  @$core.pragma('dart2js:noInline')
  static DoPlayerVoted getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoPlayerVoted>(create);
  static DoPlayerVoted? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  VoteResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(VoteResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  VoteResult ensureResult() => $_ensure(1);
}

class DoVoteCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoVoteCount',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..aOM<VoteResult>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result',
        subBuilder: VoteResult.create)
    ..hasRequiredFields = false;

  DoVoteCount._() : super();
  factory DoVoteCount({
    VoteResult? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory DoVoteCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoVoteCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoVoteCount clone() => DoVoteCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoVoteCount copyWith(void Function(DoVoteCount) updates) =>
      super.copyWith((message) => updates(message as DoVoteCount))
          as DoVoteCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoVoteCount create() => DoVoteCount._();
  DoVoteCount createEmptyInstance() => create();
  static $pb.PbList<DoVoteCount> createRepeated() => $pb.PbList<DoVoteCount>();
  @$core.pragma('dart2js:noInline')
  static DoVoteCount getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoVoteCount>(create);
  static DoVoteCount? _defaultInstance;

  @$pb.TagNumber(1)
  VoteResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(VoteResult v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  VoteResult ensureResult() => $_ensure(0);
}

class DoGameFinished extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DoGameFinished',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.state'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  DoGameFinished._() : super();
  factory DoGameFinished() => create();
  factory DoGameFinished.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoGameFinished.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoGameFinished clone() => DoGameFinished()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoGameFinished copyWith(void Function(DoGameFinished) updates) =>
      super.copyWith((message) => updates(message as DoGameFinished))
          as DoGameFinished; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DoGameFinished create() => DoGameFinished._();
  DoGameFinished createEmptyInstance() => create();
  static $pb.PbList<DoGameFinished> createRepeated() => $pb.PbList<DoGameFinished>();
  @$core.pragma('dart2js:noInline')
  static DoGameFinished getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoGameFinished>(create);
  static DoGameFinished? _defaultInstance;
}
