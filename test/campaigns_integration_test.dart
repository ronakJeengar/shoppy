import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/campaigns/data/models/campaign_model.dart';
import 'package:shopp_app/features/campaigns/data/mappers/campaign_mappers.dart';
import 'package:shopp_app/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:shopp_app/features/campaigns/domain/repositories/campaign_repository.dart';
import 'package:shopp_app/features/campaigns/domain/usecases/get_active_campaigns_usecase.dart';
import 'package:shopp_app/features/campaigns/presentation/providers/campaign_providers.dart';
import 'package:shopp_app/features/campaigns/presentation/widgets/campaign_card.dart';
import 'package:shopp_app/features/campaigns/presentation/widgets/campaign_banner_carousel.dart';

class FakeCampaignRepository implements CampaignRepository {
  final List<CampaignEntity> campaigns;
  FakeCampaignRepository(this.campaigns);

  @override
  Future<Result<List<CampaignEntity>>> getActiveCampaigns({
    int limit = 10,
    String? type,
  }) async {
    return Success(campaigns);
  }
}

void main() {
  group('Campaign Models & Mappers Tests', () {
    test('CampaignModel parses from JSON accurately', () {
      final json = {
        'id': 'camp_123',
        'title': 'Diwali Dhamaka Sale — Up to 50% Off',
        'subtitle': 'Celebrate festive joy with mega savings',
        'description': 'Exclusive discounts and instant bank offers.',
        'bannerImage': 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f',
        'campaignType': 'FESTIVAL',
        'startAt': '2026-09-10T00:00:00.000Z',
        'endAt': '2026-10-10T00:00:00.000Z',
        'isActive': true,
        'priority': 10,
        'displayOrder': 1,
        'targetType': 'CATEGORY',
        'targetId': 'electronics',
        'ctaLabel': 'Shop Festive Sale',
        'ctaAction': {
          'type': 'CATEGORY',
          'value': 'electronics',
        },
        'couponCode': 'FESTIVE20',
        'metadata': {
          'tag': 'FESTIVAL SPECIAL',
          'bgGradient': 'amber',
        },
      };

      final model = CampaignModel.fromJson(json);
      expect(model.id, 'camp_123');
      expect(model.title, 'Diwali Dhamaka Sale — Up to 50% Off');
      expect(model.campaignType, 'FESTIVAL');
      expect(model.couponCode, 'FESTIVE20');
      expect(model.priority, 10);
      expect(model.displayOrder, 1);
      expect(model.ctaAction?.type, 'CATEGORY');
      expect(model.ctaAction?.value, 'electronics');

      final entity = model.toEntity();
      expect(entity.id, 'camp_123');
      expect(entity.title, 'Diwali Dhamaka Sale — Up to 50% Off');
      expect(entity.couponCode, 'FESTIVE20');
      expect(entity.ctaAction?.type, 'CATEGORY');

      final backToModel = entity.toModel();
      expect(backToModel.id, 'camp_123');
      expect(backToModel.title, 'Diwali Dhamaka Sale — Up to 50% Off');
    });

    test('CampaignModel handles missing optional fields gracefully', () {
      final json = {
        'id': 'camp_minimal',
        'title': 'Minimal Campaign',
        'bannerImage': 'https://example.com/banner.png',
      };

      final model = CampaignModel.fromJson(json);
      expect(model.id, 'camp_minimal');
      expect(model.title, 'Minimal Campaign');
      expect(model.campaignType, 'GENERAL');
      expect(model.ctaLabel, 'Shop Now');
      expect(model.targetType, 'HOME');
      expect(model.couponCode, isNull);
    });
  });

  group('Campaign Use Case & Repository Tests', () {
    test('GetActiveCampaignsUseCase returns list of campaigns on success', () async {
      const mockCampaign = CampaignEntity(
        id: 'c1',
        title: 'Mock Campaign',
        bannerImage: 'https://example.com/img.jpg',
      );
      final repo = FakeCampaignRepository([mockCampaign]);
      final useCase = GetActiveCampaignsUseCase(repo);

      final result = await useCase(limit: 5);
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.length, 1);
      expect(result.dataOrNull?.first.id, 'c1');
    });
  });

  group('Campaign Widgets Tests', () {
    testWidgets('CampaignCard renders title, subtitle, and CTA button', (tester) async {
      const campaign = CampaignEntity(
        id: 'camp_test',
        title: 'Festival Mega Sale',
        subtitle: 'Mega savings on audio gear',
        bannerImage: 'https://example.com/img.png',
        ctaLabel: 'Shop Now',
        couponCode: 'SAVE20',
        metadata: {'tag': 'SPECIAL DEAL'},
      );

      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CampaignCard(
              campaign: campaign,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Festival Mega Sale'), findsOneWidget);
      expect(find.text('Mega savings on audio gear'), findsOneWidget);
      expect(find.text('Shop Now'), findsOneWidget);
      expect(find.text('SPECIAL DEAL'), findsOneWidget);
      expect(find.text('SAVE20'), findsOneWidget);

      await tester.tap(find.byType(CampaignCard));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('CampaignBannerCarousel returns empty when no campaigns available', (tester) async {
      final container = ProviderContainer(
        overrides: [
          activeCampaignsProvider.overrideWith((ref) async => []),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: CampaignBannerCarousel(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(PageView), findsNothing);
      expect(find.byType(CampaignCard), findsNothing);
    });

    testWidgets('CampaignBannerCarousel renders cards when campaigns available', (tester) async {
      const mockCampaign = CampaignEntity(
        id: 'camp_live',
        title: 'Live Festive Promotion',
        subtitle: 'Enjoy up to 50% discount',
        bannerImage: 'https://example.com/banner.png',
        ctaLabel: 'Claim Now',
      );

      final container = ProviderContainer(
        overrides: [
          activeCampaignsProvider.overrideWith((ref) async => [mockCampaign]),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: CampaignBannerCarousel(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(PageView), findsOneWidget);
      expect(find.text('Live Festive Promotion'), findsOneWidget);
      expect(find.text('Claim Now'), findsOneWidget);
    });
  });
}
