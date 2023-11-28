import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enitproject/model/storylist_model.dart';
import '../const/const.dart';

class StoryListNetworkRepository {
  //전체 스토리 가져오기
  Future<List<StoryListModel>> getStoryListModel() async {
    final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
    List<StoryListModel> resultList = [];
    QuerySnapshot querySnapshot = await storyListCollRef.get();
    for (var element in querySnapshot.docs) {
      resultList.add(StoryListModel.fromSnapshot(element));
    }
    return resultList;
  }

  //선택된 스토리 하나 가져오기
  Future<List<StoryListModel>> getStoryModel(String storyIDkey) async {
    final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
    List<StoryListModel> resultList = [];
    QuerySnapshot querySnapshot = await storyListCollRef.where(KEY_STORY_PLAY_LIST_KEY, isEqualTo: storyIDkey).get();
    for (var element in querySnapshot.docs) {
      resultList.add(StoryListModel.fromSnapshot(element));
    }
    return resultList;
  }

  Future<DocumentReference<Object?>> createStoryModel(StoryListModel storyListModel) async {
    final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
    final resultMap = storyListModel.toMap();

    return storyListCollRef.add(resultMap);
  }
}

StoryListNetworkRepository storyListNetworkRepository = StoryListNetworkRepository();
