import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enitproject/model/storylist_model.dart';
import '../const/const.dart';

class StoryListNetworkRepository {

  int keyAutoIncrease = 0;

  //전체 스토리 가져오기
  Future<List<StoryListModel>> getStoryListModel() async {
    final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
    List<StoryListModel> resultList = [];
    QuerySnapshot querySnapshot = await storyListCollRef.get();
    for (var element in querySnapshot.docs) {
      resultList.add(StoryListModel.fromSnapshot(element));
    }

    // change the keyAutoIncrease to the length of the list
    keyAutoIncrease = resultList.length;

    return resultList;
  }

  // //선택된 스토리 하나 가져오기
  // Future<List<StoryListModel>> getStoryModel(String storyIDkey) async {
  //   final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
  //   List<StoryListModel> resultList = [];
  //   QuerySnapshot querySnapshot = await storyListCollRef.where(KEY_STORY_PLAY_LIST_KEY, isEqualTo: storyIDkey).get();
  //   for (var element in querySnapshot.docs) {
  //     resultList.add(StoryListModel.fromSnapshot(element));
  //   }
  //   return resultList;
  // }

  Future<DocumentReference<Object?>> createStoryModel(StoryListModel storyListModel) async {
    final CollectionReference storyListCollRef = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST);
    storyListModel.pkey = keyAutoIncrease;
    keyAutoIncrease++;
    final resultMap = storyListModel.toMap();

    return storyListCollRef.add(resultMap);
  }

  Future<void> deleteStoryModel(int id) async {
    final futureWorks = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST)
    .where('pkey', isEqualTo: id)
    .get().then((value) => value.docs[0].reference.delete());

    await Future.wait([futureWorks]);
  }

  Future<void> updateStoryModel(StoryListModel storyListModel) async  {
    final futureWorks = FirebaseFirestore.instance.collection(COLLECTION_STORYPLAYLIST)
    .where('pkey', isEqualTo: storyListModel.pkey)
    .get().then((value) => value.docs[0].reference.set(storyListModel.toMap()));

    await Future.wait([futureWorks]);
  }
}

StoryListNetworkRepository storyListNetworkRepository = StoryListNetworkRepository();
