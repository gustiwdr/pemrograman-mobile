<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\ProductResource\Pages;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationLabel = 'Products';

    protected static ?string $slug = 'products';

    public static function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                Forms\Components\FileUpload::make('image')
                    ->image(),
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->live()
                    ->afterStateUpdated(function (Get $get, Set $set, ?string $old, ?string $state) {
                        // Update the slug when the name changes
                        if ($state !== $old) {
                            $set('slug', Str::slug($state));
                        }
                    }),
                Forms\Components\TextInput::make('slug')
                    ->maxLength(255),
                Forms\Components\Textarea::make('description'),
                Forms\Components\TextInput::make('price')
                    ->required()
                    ->numeric()
                    ->prefix('Rp'),
                Forms\Components\TextInput::make('stock')
                    ->numeric(),
                Forms\Components\Toggle::make('is_active'),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('slug')
                    ->searchable(),
                Tables\Columns\TextColumn::make('description')->limit(20),
                Tables\Columns\TextColumn::make('price')
                    ->prefix('Rp'),
                Tables\Columns\TextColumn::make('stock'),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }
}
