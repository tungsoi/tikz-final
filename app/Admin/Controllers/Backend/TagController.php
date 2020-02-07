<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use Brazzer\Admin\Controllers\ModelForm;
use App\Models\Tag;
use Illuminate\Support\Str;

class TagController extends Controller
{
    use ModelForm;

    public function __construct()
    {
        //
    }

    /**
     * Return page index
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Thẻ đính kèm')
            ->description('Danh sách')
            ->body($this->grid());
    }

    /**
     * Return page edit
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Thẻ đính kèm')
            ->description('Chỉnh sửa')
            ->body(
                $this->form()->edit($id)
            );
    }

    /**
     * Return page create
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Thẻ đính kèm')
            ->description('Tạo mới')
            ->body($this->form());
    }

    /**
     * Build table in page index
     *
     * @return Grid
     */
    protected function grid()
    {
        return Tag::grid(function(Grid $grid)
        {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function($filter){
                $filter->expand();
                $filter->disableIdFilter();
                $filter->like('name');
            });

            $grid->quickCreate(function (Grid\Tools\QuickCreate $create) {
                $create->text('name');
            });

            $grid->id()->sortable();
            $grid->name()->editable();

        });
    }

    /**
     * Build form for edit or create
     *
     * @return Form
     */
    public function form()
    {
        return Tag::form(function (Form $form)
        {
            $form->hidden('id', 'ID');
            $form->text('name');

            $form->saving(function ($form) {
                if (!is_null($form->model()->id)) {
                    Tag::find($form->model()->id)->update([
                        'name'  =>  $form->name,
                        'code'  =>  Str::slug($form->name)
                    ]);
                } else {
                    Tag::create([
                        'name'  =>  $form->name,
                        'code'  =>  Str::slug($form->name)
                    ]);
                }

                return redirect('admin/tags')->with('success');
            });

            $form->footer(function ($footer)
            {
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

        });
    }

    /**
     * Return page detail
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Tags')
            ->description(trans('admin.detail'))
            ->body(
                    $this->detail($id)
            );
    }

    /**
     * Build detail contact form
     *
     * @param Integer $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Tag::findOrFail($id));

        $show->name();

        return $show;
    }
}
